import 'package:flutter/material.dart';

import '../../core/database/app_database.dart';
import '../../core/localization/app_strings.dart';
import '../../data/sources/source_validator.dart';
import '../../data/sources/source_sync_service.dart';

class SourcesPage extends StatefulWidget {
  const SourcesPage({required this.database, super.key});
  final AppDatabase database;

  @override
  State<SourcesPage> createState() => _SourcesPageState();
}

class _SourcesPageState extends State<SourcesPage> {
  bool _busy = false;
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
    final strings = AppStrings.of(context);
    setState(() => _busy = true);
    final count = await SourceSyncService(widget.database).syncAll();
    await _reload();
    if (!mounted) return;
    setState(() => _busy = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(strings.imported(count))));
  }

  Future<void> _addSource() async {
    final controller = TextEditingController();
    var validate = true;
    final strings = AppStrings.of(context);
    final result = await showDialog<({String url, bool validate})>(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setDialogState) => AlertDialog(
        title: Text(strings.addSource),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(controller: controller, keyboardType: TextInputType.url, decoration: InputDecoration(labelText: strings.sourceUrl)),
          CheckboxListTile(contentPadding: EdgeInsets.zero, value: validate, title: Text(strings.validateBeforeSave), subtitle: Text(strings.validationHint), onChanged: (value) => setDialogState(() => validate = value ?? true)),
        ]),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(strings.cancel)),
          FilledButton(onPressed: () => Navigator.pop(context, (url: controller.text.trim(), validate: validate)), child: Text(strings.save)),
        ],
      )),
    );
    controller.dispose();
    if (result == null || result.url.isEmpty || !mounted) return;
    setState(() => _busy = true);
    final validation = await SourceValidator().validate(result.url, enabled: result.validate);
    if (!mounted) return;
    if (!validation.accepted) {
      setState(() => _busy = false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(validation.message)));
      return;
    }
    await widget.database.insertSourceFile(url: result.url, sourceType: validation.sourceType, validationEnabled: result.validate, validationStatus: validation.status);
    await _reload();
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    final files = _files;
    return Stack(children: [
      ListView(padding: const EdgeInsets.all(16), children: [
        Row(children: [
          Expanded(child: Text(strings.sources, style: Theme.of(context).textTheme.headlineSmall)),
          IconButton(onPressed: _busy ? null : _syncSources, tooltip: strings.refresh, icon: const Icon(Icons.sync)),
        ]),
        const SizedBox(height: 12), Text(strings.sourceDescription), const SizedBox(height: 20),
        if (files.isEmpty) Text(strings.noSources),
        for (final file in files) Card(child: ListTile(
          leading: Icon(file.sourceType == 'github_repository' ? Icons.code : Icons.description),
          title: Text(file.sourceType == 'github_repository' ? strings.githubRepository : strings.txtFile),
          subtitle: Text('${file.url}\n${_statusLabel(strings, file.validationStatus)}'),
        )),
        if (_busy) const Padding(padding: EdgeInsets.only(top: 16), child: LinearProgressIndicator()),
      ]),
      Positioned(right: 20, bottom: 20, child: FloatingActionButton.extended(onPressed: _busy ? null : _addSource, icon: const Icon(Icons.add), label: Text(strings.addSource))),
    ]);
  }

  String _statusLabel(AppStrings strings, String? status) => switch (status) {
        'pending' => strings.pending,
        'synced' || 'validated' => strings.synced,
        'sync_failed' || 'validation_failed' => strings.syncFailed,
        'validation_skipped' => strings.validationSkipped,
        _ => strings.notValidated,
      };
}
