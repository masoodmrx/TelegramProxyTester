import 'package:flutter/material.dart';

import '../../core/database/app_database.dart';
import '../../core/telegram/telegram_proxy_launcher.dart';
import '../../l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    required this.database,
    required this.saveLanguage,
    required this.saveTheme,
    required this.saveMode,
    super.key,
  });
  final AppDatabase database;
  final void Function(String) saveLanguage;
  final void Function(String) saveTheme;
  final void Function(String) saveMode;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final settings = database.settingsCache;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          strings.settings,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: settings['language'] ?? 'system',
          decoration: InputDecoration(
            labelText: strings.language,
            border: const OutlineInputBorder(),
          ),
          items: [
            DropdownMenuItem(value: 'system', child: Text(strings.system)),
            DropdownMenuItem(value: 'fa', child: Text(strings.persian)),
            DropdownMenuItem(value: 'en', child: Text(strings.english)),
          ],
          onChanged: (value) {
            if (value != null) saveLanguage(value);
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: settings['app_mode'] == 'advanced'
              ? 'advanced'
              : 'simple',
          decoration: InputDecoration(
            labelText: strings.appMode,
            border: const OutlineInputBorder(),
          ),
          items: [
            DropdownMenuItem(value: 'simple', child: Text(strings.simpleMode)),
            DropdownMenuItem(
              value: 'advanced',
              child: Text(strings.advancedMode),
            ),
          ],
          onChanged: (value) {
            if (value != null) saveMode(value);
          },
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          initialValue: settings['theme'] ?? 'system',
          decoration: InputDecoration(
            labelText: strings.theme,
            border: const OutlineInputBorder(),
          ),
          items: [
            DropdownMenuItem(value: 'system', child: Text(strings.system)),
            DropdownMenuItem(value: 'light', child: Text(strings.light)),
            DropdownMenuItem(value: 'dark', child: Text(strings.dark)),
          ],
          onChanged: (value) {
            if (value != null) saveTheme(value);
          },
        ),
        const SizedBox(height: 24),
        Text(strings.retention, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        _RetentionField(
          label: strings.checkHistoryRetention,
          days: settings['proxy_checks_retention_days'] ?? '30',
          suffix: strings.days,
          onChanged: (value) =>
              database.setSetting('proxy_checks_retention_days', value),
        ),
        const SizedBox(height: 16),
        _RetentionField(
          label: strings.staleProxyRetention,
          days: settings['stale_proxy_retention_days'] ?? '14',
          suffix: strings.days,
          onChanged: (value) =>
              database.setSetting('stale_proxy_retention_days', value),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () async {
            final result = await database.cleanupRetention(
              checkHistoryDays:
                  int.tryParse(
                    settings['proxy_checks_retention_days'] ?? '30',
                  ) ??
                  30,
              staleProxyDays:
                  int.tryParse(
                    settings['stale_proxy_retention_days'] ?? '14',
                  ) ??
                  14,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    strings.cleanupResult(result.checks, result.proxies),
                  ),
                ),
              );
            }
          },
          icon: const Icon(Icons.cleaning_services),
          label: Text(strings.cleanup),
        ),
        const SizedBox(height: 32),
        Center(
          child: Column(
            children: [
              Text(
                strings.createdWithLove,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              InkWell(
                onTap: () => TelegramProxyLauncher.openProfile('MasoudMahdyan'),
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Text(
                    strings.telegramProfile,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RetentionField extends StatelessWidget {
  const _RetentionField({
    required this.label,
    required this.days,
    required this.suffix,
    required this.onChanged,
  });
  final String label;
  final String days;
  final String suffix;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) => TextFormField(
    initialValue: days,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      suffixText: suffix,
    ),
    onChanged: (value) {
      if (int.tryParse(value) != null && int.parse(value) >= 0) {
        onChanged(value);
      }
    },
  );
}
