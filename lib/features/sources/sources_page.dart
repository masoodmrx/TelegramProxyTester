import 'package:flutter/material.dart';

import '../../core/database/app_database.dart';
import '../../l10n/app_localizations.dart';
import '../../data/sources/source_validator.dart';
import '../../data/sources/source_sync_service.dart';

class SourcesPage extends StatefulWidget {
  const SourcesPage({
    required this.database,
    required this.syncService,
    super.key,
  });
  final AppDatabase database;
  final SourceSyncService syncService;

  @override
  State<SourcesPage> createState() => _SourcesPageState();
}

class _SourcesPageState extends State<SourcesPage> {
  bool _busy = false;
  double? _progress;
  List<dynamic> _files = const [];

  @override
  void initState() {
    super.initState();
    _reload();
  }

  Future<void> _reload() async {
    final files = await widget.database.sourceFilesList();
    if (mounted) setState(() => _files = files);
  }

  Future<void> _syncSources() async {
    final strings = AppLocalizations.of(context)!;
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final count = await widget.syncService.syncAll(
        onProgress: (current, total) {
          if (mounted) {
            setState(() => _progress = total == 0 ? 1 : current / total);
          }
        },
      );
      await _reload();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(strings.imported(count))));
      }
    } on SourceSyncCancelledException {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(strings.operationCancelled)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(strings.operationFailed)));
      }
    } finally {
      if (mounted) {
        setState(() {
          _busy = false;
          _progress = null;
        });
      }
    }
  }

  Future<void> _refreshDefaultSources() async {
    if (_busy) return;
    final strings = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      final count = await widget.syncService.refreshDefaultSources();
      await _reload();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(strings.defaultSourcesUpdated(count))),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(strings.operationFailed)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _addSource() async {
    final controller = TextEditingController();
    var validate = true;
    final strings = AppLocalizations.of(context)!;
    final result = await showDialog<({String url, bool validate})>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(strings.addSource),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(labelText: strings.sourceUrl),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: validate,
                title: Text(strings.validateBeforeSave),
                subtitle: Text(strings.validationHint),
                onChanged: (value) =>
                    setDialogState(() => validate = value ?? true),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(strings.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, (
                url: controller.text.trim(),
                validate: validate,
              )),
              child: Text(strings.save),
            ),
          ],
        ),
      ),
    );
    controller.dispose();
    if (result == null || result.url.isEmpty || !mounted) return;
    setState(() => _busy = true);
    final validation = await SourceValidator().validate(
      result.url,
      enabled: result.validate,
    );
    if (!mounted) return;
    if (!validation.accepted) {
      setState(() => _busy = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(validation.message)));
      return;
    }
    await widget.database.insertSourceFile(
      url: result.url,
      sourceType: validation.sourceType,
      validationEnabled: result.validate,
      validationStatus: validation.status,
    );
    await _reload();
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final files = _files;
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    strings.sources,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                IconButton(
                  onPressed: _busy ? null : _refreshDefaultSources,
                  tooltip: strings.updateDefaultSources,
                  icon: const Icon(Icons.cloud_download),
                ),
                IconButton(
                  onPressed: _busy ? widget.syncService.cancel : _syncSources,
                  tooltip: _busy ? strings.cancel : strings.refresh,
                  icon: Icon(_busy ? Icons.cancel : Icons.sync),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(strings.sourceDescription),
            const SizedBox(height: 20),
            if (files.isEmpty) Text(strings.noSources),
            for (final file in files)
              Card(
                child: ListTile(
                  leading: Icon(
                    file.sourceType == 'github_repository'
                        ? Icons.code
                        : Icons.description,
                  ),
                  title: Text(
                    file.sourceType == 'github_repository'
                        ? strings.githubRepository
                        : strings.txtFile,
                  ),
                  subtitle: Text(
                    '${file.url}\n${_statusLabel(strings, file.validationStatus)}',
                  ),
                ),
              ),
            if (_busy)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: LinearProgressIndicator(value: _progress),
              ),
          ],
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: FloatingActionButton.extended(
            onPressed: _busy ? null : _addSource,
            icon: const Icon(Icons.add),
            label: Text(strings.addSource),
          ),
        ),
      ],
    );
  }

  String _statusLabel(AppLocalizations strings, String? status) =>
      switch (status) {
        'pending' => strings.pending,
        'synced' || 'validated' => strings.synced,
        'sync_failed' || 'validation_failed' => strings.syncFailed,
        'validation_skipped' => strings.validationSkipped,
        _ => strings.notValidated,
      };
}
