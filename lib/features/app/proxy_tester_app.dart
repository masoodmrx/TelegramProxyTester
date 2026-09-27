import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../core/database/app_database.dart';
import '../../core/localization/app_strings.dart';
import '../../core/theme/app_theme.dart';
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

  @override
  void initState() {
    super.initState();
    final settings = widget.database.settingsCache;
    _locale = settings['language'] == null || settings['language'] == 'system' ? null : Locale(settings['language']!);
    _themeMode = switch (settings['theme']) { 'light' => ThemeMode.light, 'dark' => ThemeMode.dark, _ => ThemeMode.system };
  }

  void _saveLanguage(String value) {
    widget.database.setSetting('language', value);
    setState(() => _locale = value == 'system' ? null : Locale(value));
  }

  void _saveTheme(String value) {
    widget.database.setSetting('theme', value);
    setState(() => _themeMode = switch (value) { 'light' => ThemeMode.light, 'dark' => ThemeMode.dark, _ => ThemeMode.system });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Telegram Proxy Tester',
        locale: _locale,
        supportedLocales: const [Locale('en'), Locale('fa')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supported) => _locale ?? supported.firstWhere((item) => item.languageCode == locale?.languageCode, orElse: () => const Locale('en')),
        themeMode: _themeMode,
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: HomePage(database: widget.database, saveLanguage: _saveLanguage, saveTheme: _saveTheme),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({required this.database, required this.saveLanguage, required this.saveTheme, super.key});
  final AppDatabase database;
  final void Function(String) saveLanguage;
  final void Function(String) saveTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    final pages = [
      ProxyListPage(database: widget.database),
      SourcesPage(database: widget.database),
      SettingsPage(database: widget.database, saveLanguage: widget.saveLanguage, saveTheme: widget.saveTheme),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(strings.appTitle), backgroundColor: Theme.of(context).colorScheme.primaryContainer),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.speed), label: strings.proxies),
          NavigationDestination(icon: const Icon(Icons.source), label: strings.sources),
          NavigationDestination(icon: const Icon(Icons.settings), label: strings.settings),
        ],
      ),
    );
  }
}
