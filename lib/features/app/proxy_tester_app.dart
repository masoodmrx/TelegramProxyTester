import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../core/database/app_database.dart';
import '../../l10n/app_localizations.dart';
import '../../core/theme/app_theme.dart';
import '../../data/sources/source_sync_service.dart';
import '../dashboard/dashboard_page.dart';
import '../proxies/proxy_list_page.dart';
import '../settings/settings_page.dart';
import '../sources/sources_page.dart';

class ProxyTesterApp extends StatefulWidget {
  const ProxyTesterApp({required this.database, super.key});
  final AppDatabase database;

  @override
  State<ProxyTesterApp> createState() => _ProxyTesterAppState();
}

class _ProxyTesterAppState extends State<ProxyTesterApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;
  late final SourceSyncService _sourceSyncService;

  @override
  void initState() {
    super.initState();
    _sourceSyncService = SourceSyncService(widget.database);
    final settings = widget.database.settingsCache;
    _locale = settings['language'] == null || settings['language'] == 'system'
        ? null
        : Locale(settings['language']!);
    _themeMode = switch (settings['theme']) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  void _saveLanguage(String value) {
    widget.database.setSetting('language', value);
    setState(() => _locale = value == 'system' ? null : Locale(value));
  }

  void _saveTheme(String value) {
    widget.database.setSetting('theme', value);
    setState(
      () => _themeMode = switch (value) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      },
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Telegram Proxy Tester',
    locale: _locale,
    supportedLocales: const [Locale('en'), Locale('fa')],
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    localeResolutionCallback: (locale, supported) =>
        _locale ??
        supported.firstWhere(
          (item) => item.languageCode == locale?.languageCode,
          orElse: () => const Locale('en'),
        ),
    themeMode: _themeMode,
    theme: AppTheme.light(),
    darkTheme: AppTheme.dark(),
    home: HomePage(
      database: widget.database,
      sourceSyncService: _sourceSyncService,
      saveLanguage: _saveLanguage,
      saveTheme: _saveTheme,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({
    required this.database,
    required this.sourceSyncService,
    required this.saveLanguage,
    required this.saveTheme,
    super.key,
  });
  final AppDatabase database;
  final SourceSyncService sourceSyncService;
  final void Function(String) saveLanguage;
  final void Function(String) saveTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  bool get _advanced => widget.database.settingsCache['app_mode'] == 'advanced';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _runFirstLaunchFlow());
    _syncSourcesOnStartup();
  }

  Future<void> _runFirstLaunchFlow() async {
    if (!mounted) return;
    if (widget.database.settingsCache['language'] == 'unset') {
      final language = await _showLanguagePicker();
      if (language == null || !mounted) return;
      await widget.database.setSetting('language', language);
      setState(() {});
    }
    await _showModePickerIfNeeded();
    if (!mounted ||
        widget.database.settingsCache['tutorial_completed'] == 'true') {
      return;
    }
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => _TutorialDialog(advanced: _advanced),
    );
    await widget.database.setSetting('tutorial_completed', 'true');
  }

  Future<String?> _showLanguagePicker() {
    final strings = AppLocalizations.of(context)!;
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(strings.chooseLanguage),
        content: Text(strings.languageDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'system'),
            child: Text(strings.system),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, 'fa'),
            child: Text(strings.persian),
          ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context, 'en'),
            child: Text(strings.english),
          ),
        ],
      ),
    );
  }

  Future<void> _syncSourcesOnStartup() async {
    try {
      await widget.sourceSyncService.syncAll();
    } catch (_) {
      // Startup synchronization is best-effort. The user can retry manually.
    }
  }

  Future<void> _showModePickerIfNeeded() async {
    if (widget.database.settingsCache['app_mode'] != 'unset' || !mounted) {
      return;
    }
    final strings = AppLocalizations.of(context)!;
    final mode = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(strings.chooseAppMode),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(strings.simpleModeDescription),
            const SizedBox(height: 12),
            Text(strings.advancedModeDescription),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(context, 'simple'),
            child: Text(strings.simpleMode),
          ),
          OutlinedButton(
            onPressed: () => Navigator.pop(context, 'advanced'),
            child: Text(strings.advancedMode),
          ),
        ],
      ),
    );
    if (mode != null && mounted) {
      await widget.database.setSetting('app_mode', mode);
      setState(() {});
    }
  }

  void _saveMode(String value) {
    widget.database.settingsCache['app_mode'] = value;
    widget.database.setSetting('app_mode', value);
    setState(() {
      if (value == 'simple' && _index > 1) _index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final pages = <Widget>[
      DashboardPage(database: widget.database),
      ProxyListPage(database: widget.database),
    ];
    if (_advanced) {
      pages.add(
        SourcesPage(
          database: widget.database,
          syncService: widget.sourceSyncService,
        ),
      );
    }
    pages.add(
      SettingsPage(
        database: widget.database,
        saveLanguage: widget.saveLanguage,
        saveTheme: widget.saveTheme,
        saveMode: _saveMode,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(strings.appTitle),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.dashboard),
            label: strings.dashboard,
          ),
          NavigationDestination(
            icon: const Icon(Icons.speed),
            label: strings.proxies,
          ),
          if (_advanced)
            NavigationDestination(
              icon: const Icon(Icons.source),
              label: strings.sources,
            ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: strings.settings,
          ),
        ],
      ),
    );
  }
}

class _TutorialDialog extends StatefulWidget {
  const _TutorialDialog({required this.advanced});
  final bool advanced;

  @override
  State<_TutorialDialog> createState() => _TutorialDialogState();
}

class _TutorialDialogState extends State<_TutorialDialog> {
  int _step = 0;

  List<({IconData icon, String title, String description})> _steps(
    AppLocalizations strings,
  ) => [
    (
      icon: Icons.dashboard,
      title: strings.tutorialDashboardTitle,
      description: strings.tutorialDashboardDescription,
    ),
    (
      icon: Icons.speed,
      title: strings.tutorialProxiesTitle,
      description: strings.tutorialProxiesDescription,
    ),
    if (widget.advanced)
      (
        icon: Icons.source,
        title: strings.tutorialSourcesTitle,
        description: strings.tutorialSourcesDescription,
      ),
    (
      icon: Icons.settings,
      title: strings.tutorialSettingsTitle,
      description: strings.tutorialSettingsDescription,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    final steps = _steps(strings);
    final current = steps[_step];
    final last = _step == steps.length - 1;
    return AlertDialog(
      title: Text(strings.tutorialTitle),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              current.icon,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              current.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(current.description, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text('${_step + 1} / ${steps.length}'),
          ],
        ),
      ),
      actions: [
        if (_step > 0)
          TextButton(
            onPressed: () => setState(() => _step--),
            child: Text(strings.tutorialBack),
          ),
        FilledButton(
          onPressed: () =>
              last ? Navigator.pop(context) : setState(() => _step++),
          child: Text(last ? strings.tutorialFinish : strings.tutorialNext),
        ),
      ],
    );
  }
}
