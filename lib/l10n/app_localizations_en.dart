// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Telegram Proxy Tester';

  @override
  String get proxies => 'Proxies';

  @override
  String get proxyList => 'Proxy list';

  @override
  String get sources => 'Sources';

  @override
  String get settings => 'Settings';

  @override
  String get refresh => 'Refresh';

  @override
  String get updateDefaultSources => 'Update default sources';

  @override
  String defaultSourcesUpdated(int count) {
    return '$count default sources updated.';
  }

  @override
  String get noProxies => 'No proxies have been added yet.';

  @override
  String get noSources => 'No sources have been added yet.';

  @override
  String get sourceDescription =>
      'Default GitHub sources are ready from the start. You can add another TXT file or repository.';

  @override
  String get notChecked => 'Not checked';

  @override
  String get notValidated => 'Not validated';

  @override
  String get open => 'Open';

  @override
  String get telegramNotInstalled =>
      'Telegram is not installed or could not be opened.';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get system => 'System';

  @override
  String get persian => 'Persian';

  @override
  String get english => 'English';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get retention => 'Data retention';

  @override
  String get checkHistoryRetention => 'Proxy check history retention';

  @override
  String get staleProxyRetention => 'Stale proxy retention';

  @override
  String get days => 'days';

  @override
  String get addSource => 'Add source';

  @override
  String get sourceUrl => 'TXT URL or GitHub repository';

  @override
  String get validateBeforeSave => 'Validate before saving';

  @override
  String get validationHint => 'Disable this if the network is unavailable.';

  @override
  String get cancel => 'Cancel';

  @override
  String get operationCancelled => 'Operation cancelled.';

  @override
  String get operationFailed => 'The operation failed.';

  @override
  String get save => 'Save';

  @override
  String get githubRepository => 'GitHub repository';

  @override
  String get txtFile => 'TXT file';

  @override
  String get pending => 'Pending update';

  @override
  String get synced => 'Updated';

  @override
  String get syncFailed => 'Update failed';

  @override
  String get validationSkipped => 'Validation skipped';

  @override
  String imported(int count) {
    return '$count proxies imported.';
  }

  @override
  String get search => 'Search domain or IP';

  @override
  String get healthyOnly => 'Healthy';

  @override
  String get favorites => 'Favorites';

  @override
  String get close => 'Close';

  @override
  String get checkHealth => 'Check proxy health';

  @override
  String healthResult(int count) {
    return '$count proxies checked.';
  }

  @override
  String get internetUnavailable =>
      'No internet connection. Check your connection first.';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get simpleMode => 'Simple mode';

  @override
  String get advancedMode => 'Advanced mode';

  @override
  String get simpleModeDescription => 'Shows only proxies and their status.';

  @override
  String get advancedModeDescription =>
      'Full source, proxy, and settings management.';

  @override
  String get chooseAppMode => 'Choose how you want to use the app';

  @override
  String get appMode => 'App mode';

  @override
  String get chooseLanguage => 'Choose your language';

  @override
  String get languageDescription => 'Select the language for the application.';

  @override
  String get tutorialTitle => 'Quick tour';

  @override
  String get tutorialNext => 'Next';

  @override
  String get tutorialBack => 'Back';

  @override
  String get tutorialFinish => 'Finish';

  @override
  String get tutorialDashboardTitle => 'Dashboard';

  @override
  String get tutorialDashboardDescription =>
      'See the total number of proxies, healthy proxies, sources, and check history at a glance.';

  @override
  String get tutorialProxiesTitle => 'Proxy list';

  @override
  String get tutorialProxiesDescription =>
      'Search, filter, check proxy health, mark favorites, and open a proxy in Telegram.';

  @override
  String get tutorialSourcesTitle => 'Sources';

  @override
  String get tutorialSourcesDescription =>
      'Update default GitHub repositories, sync TXT files, add sources, and cancel a running update.';

  @override
  String get tutorialSettingsTitle => 'Settings';

  @override
  String get tutorialSettingsDescription =>
      'Change language, theme, app mode, and retention settings. The refresh and health buttons show progress and can be cancelled.';

  @override
  String get totalProxies => 'All proxies';

  @override
  String get healthyProxies => 'Healthy proxies';

  @override
  String get sourceCount => 'Sources';

  @override
  String get checkCount => 'Checks';

  @override
  String get cleanup => 'Clean up old data';

  @override
  String cleanupResult(int checks, int proxies) {
    return '$checks checks and $proxies proxies removed.';
  }

  @override
  String get createdWithLove => 'Created with ❤️ by Masoud Mahdian';

  @override
  String get telegramProfile => '@MasoudMahdyan';
}
