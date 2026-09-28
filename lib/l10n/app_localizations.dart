import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fa'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Telegram Proxy Tester'**
  String get appTitle;

  /// No description provided for @proxies.
  ///
  /// In en, this message translates to:
  /// **'Proxies'**
  String get proxies;

  /// No description provided for @proxyList.
  ///
  /// In en, this message translates to:
  /// **'Proxy list'**
  String get proxyList;

  /// No description provided for @sources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sources;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @updateDefaultSources.
  ///
  /// In en, this message translates to:
  /// **'Update default sources'**
  String get updateDefaultSources;

  /// No description provided for @defaultSourcesUpdated.
  ///
  /// In en, this message translates to:
  /// **'{count} default sources updated.'**
  String defaultSourcesUpdated(int count);

  /// No description provided for @noProxies.
  ///
  /// In en, this message translates to:
  /// **'No proxies have been added yet.'**
  String get noProxies;

  /// No description provided for @noSources.
  ///
  /// In en, this message translates to:
  /// **'No sources have been added yet.'**
  String get noSources;

  /// No description provided for @sourceDescription.
  ///
  /// In en, this message translates to:
  /// **'Default GitHub sources are ready from the start. You can add another TXT file or repository.'**
  String get sourceDescription;

  /// No description provided for @notChecked.
  ///
  /// In en, this message translates to:
  /// **'Not checked'**
  String get notChecked;

  /// No description provided for @notValidated.
  ///
  /// In en, this message translates to:
  /// **'Not validated'**
  String get notValidated;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @telegramNotInstalled.
  ///
  /// In en, this message translates to:
  /// **'Telegram is not installed or could not be opened.'**
  String get telegramNotInstalled;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @persian.
  ///
  /// In en, this message translates to:
  /// **'Persian'**
  String get persian;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @retention.
  ///
  /// In en, this message translates to:
  /// **'Data retention'**
  String get retention;

  /// No description provided for @checkHistoryRetention.
  ///
  /// In en, this message translates to:
  /// **'Proxy check history retention'**
  String get checkHistoryRetention;

  /// No description provided for @staleProxyRetention.
  ///
  /// In en, this message translates to:
  /// **'Stale proxy retention'**
  String get staleProxyRetention;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'days'**
  String get days;

  /// No description provided for @addSource.
  ///
  /// In en, this message translates to:
  /// **'Add source'**
  String get addSource;

  /// No description provided for @sourceUrl.
  ///
  /// In en, this message translates to:
  /// **'TXT URL or GitHub repository'**
  String get sourceUrl;

  /// No description provided for @validateBeforeSave.
  ///
  /// In en, this message translates to:
  /// **'Validate before saving'**
  String get validateBeforeSave;

  /// No description provided for @validationHint.
  ///
  /// In en, this message translates to:
  /// **'Disable this if the network is unavailable.'**
  String get validationHint;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @operationCancelled.
  ///
  /// In en, this message translates to:
  /// **'Operation cancelled.'**
  String get operationCancelled;

  /// No description provided for @operationFailed.
  ///
  /// In en, this message translates to:
  /// **'The operation failed.'**
  String get operationFailed;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @githubRepository.
  ///
  /// In en, this message translates to:
  /// **'GitHub repository'**
  String get githubRepository;

  /// No description provided for @txtFile.
  ///
  /// In en, this message translates to:
  /// **'TXT file'**
  String get txtFile;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending update'**
  String get pending;

  /// No description provided for @synced.
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get synced;

  /// No description provided for @syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed'**
  String get syncFailed;

  /// No description provided for @validationSkipped.
  ///
  /// In en, this message translates to:
  /// **'Validation skipped'**
  String get validationSkipped;

  /// No description provided for @imported.
  ///
  /// In en, this message translates to:
  /// **'{count} proxies imported.'**
  String imported(int count);

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search domain or IP'**
  String get search;

  /// No description provided for @healthyOnly.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get healthyOnly;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @checkHealth.
  ///
  /// In en, this message translates to:
  /// **'Check proxy health'**
  String get checkHealth;

  /// No description provided for @healthResult.
  ///
  /// In en, this message translates to:
  /// **'{count} proxies checked.'**
  String healthResult(int count);

  /// No description provided for @internetUnavailable.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Check your connection first.'**
  String get internetUnavailable;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @simpleMode.
  ///
  /// In en, this message translates to:
  /// **'Simple mode'**
  String get simpleMode;

  /// No description provided for @advancedMode.
  ///
  /// In en, this message translates to:
  /// **'Advanced mode'**
  String get advancedMode;

  /// No description provided for @simpleModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Shows only proxies and their status.'**
  String get simpleModeDescription;

  /// No description provided for @advancedModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Full source, proxy, and settings management.'**
  String get advancedModeDescription;

  /// No description provided for @chooseAppMode.
  ///
  /// In en, this message translates to:
  /// **'Choose how you want to use the app'**
  String get chooseAppMode;

  /// No description provided for @appMode.
  ///
  /// In en, this message translates to:
  /// **'App mode'**
  String get appMode;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseLanguage;

  /// No description provided for @languageDescription.
  ///
  /// In en, this message translates to:
  /// **'Select the language for the application.'**
  String get languageDescription;

  /// No description provided for @tutorialTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick tour'**
  String get tutorialTitle;

  /// No description provided for @tutorialNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get tutorialNext;

  /// No description provided for @tutorialBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get tutorialBack;

  /// No description provided for @tutorialFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get tutorialFinish;

  /// No description provided for @tutorialDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get tutorialDashboardTitle;

  /// No description provided for @tutorialDashboardDescription.
  ///
  /// In en, this message translates to:
  /// **'See the total number of proxies, healthy proxies, sources, and check history at a glance.'**
  String get tutorialDashboardDescription;

  /// No description provided for @tutorialProxiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Proxy list'**
  String get tutorialProxiesTitle;

  /// No description provided for @tutorialProxiesDescription.
  ///
  /// In en, this message translates to:
  /// **'Search, filter, check proxy health, mark favorites, and open a proxy in Telegram.'**
  String get tutorialProxiesDescription;

  /// No description provided for @tutorialSourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get tutorialSourcesTitle;

  /// No description provided for @tutorialSourcesDescription.
  ///
  /// In en, this message translates to:
  /// **'Update default GitHub repositories, sync TXT files, add sources, and cancel a running update.'**
  String get tutorialSourcesDescription;

  /// No description provided for @tutorialSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tutorialSettingsTitle;

  /// No description provided for @tutorialSettingsDescription.
  ///
  /// In en, this message translates to:
  /// **'Change language, theme, app mode, and retention settings. The refresh and health buttons show progress and can be cancelled.'**
  String get tutorialSettingsDescription;

  /// No description provided for @totalProxies.
  ///
  /// In en, this message translates to:
  /// **'All proxies'**
  String get totalProxies;

  /// No description provided for @healthyProxies.
  ///
  /// In en, this message translates to:
  /// **'Healthy proxies'**
  String get healthyProxies;

  /// No description provided for @sourceCount.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sourceCount;

  /// No description provided for @checkCount.
  ///
  /// In en, this message translates to:
  /// **'Checks'**
  String get checkCount;

  /// No description provided for @cleanup.
  ///
  /// In en, this message translates to:
  /// **'Clean up old data'**
  String get cleanup;

  /// No description provided for @cleanupResult.
  ///
  /// In en, this message translates to:
  /// **'{checks} checks and {proxies} proxies removed.'**
  String cleanupResult(int checks, int proxies);

  /// No description provided for @createdWithLove.
  ///
  /// In en, this message translates to:
  /// **'Created with ❤️ by Masoud Mahdian'**
  String get createdWithLove;

  /// No description provided for @telegramProfile.
  ///
  /// In en, this message translates to:
  /// **'@MasoudMahdyan'**
  String get telegramProfile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
