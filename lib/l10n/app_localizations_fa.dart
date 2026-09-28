// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'آزمایشگر پروکسی تلگرام';

  @override
  String get proxies => 'پروکسی‌ها';

  @override
  String get proxyList => 'فهرست پروکسی‌ها';

  @override
  String get sources => 'منابع';

  @override
  String get settings => 'تنظیمات';

  @override
  String get refresh => 'به‌روزرسانی';

  @override
  String get updateDefaultSources => 'به‌روزرسانی منابع پیش‌فرض';

  @override
  String defaultSourcesUpdated(int count) {
    return '$count منبع پیش‌فرض به‌روزرسانی شد.';
  }

  @override
  String get noProxies => 'هنوز پروکسی‌ای ثبت نشده است.';

  @override
  String get noSources => 'هنوز منبعی ثبت نشده است.';

  @override
  String get sourceDescription =>
      'منابع پیش‌فرض GitHub از ابتدا آماده هستند. می‌توانید منبع TXT یا مخزن دیگری اضافه کنید.';

  @override
  String get notChecked => 'بررسی نشده';

  @override
  String get notValidated => 'اعتبارسنجی نشده';

  @override
  String get open => 'باز کردن';

  @override
  String get telegramNotInstalled =>
      'تلگرام نصب نیست یا امکان باز کردن آن وجود ندارد.';

  @override
  String get language => 'زبان';

  @override
  String get theme => 'تم';

  @override
  String get system => 'سیستم';

  @override
  String get persian => 'فارسی';

  @override
  String get english => 'انگلیسی';

  @override
  String get light => 'روشن';

  @override
  String get dark => 'تاریک';

  @override
  String get retention => 'نگهداری داده‌ها';

  @override
  String get checkHistoryRetention => 'مدت نگهداری تاریخچه بررسی‌ها';

  @override
  String get staleProxyRetention => 'مدت حذف پروکسی بدون پاسخ موفق';

  @override
  String get days => 'روز';

  @override
  String get addSource => 'افزودن منبع';

  @override
  String get sourceUrl => 'لینک TXT یا مخزن GitHub';

  @override
  String get validateBeforeSave => 'اعتبارسنجی قبل از ذخیره';

  @override
  String get validationHint => 'در صورت قطعی شبکه می‌توانید آن را خاموش کنید.';

  @override
  String get cancel => 'لغو';

  @override
  String get operationCancelled => 'عملیات لغو شد.';

  @override
  String get operationFailed => 'انجام عملیات ناموفق بود.';

  @override
  String get save => 'ذخیره';

  @override
  String get githubRepository => 'مخزن GitHub';

  @override
  String get txtFile => 'فایل TXT';

  @override
  String get pending => 'در انتظار به‌روزرسانی';

  @override
  String get synced => 'به‌روزرسانی شد';

  @override
  String get syncFailed => 'به‌روزرسانی ناموفق';

  @override
  String get validationSkipped => 'اعتبارسنجی رد شد';

  @override
  String imported(int count) {
    return '$count پروکسی وارد شد.';
  }

  @override
  String get search => 'جست‌وجوی دامنه یا IP';

  @override
  String get healthyOnly => 'سالم';

  @override
  String get favorites => 'موردعلاقه';

  @override
  String get close => 'بستن';

  @override
  String get checkHealth => 'بررسی سلامت پروکسی‌ها';

  @override
  String healthResult(int count) {
    return '$count پروکسی بررسی شد.';
  }

  @override
  String get internetUnavailable =>
      'اتصال اینترنت برقرار نیست؛ ابتدا اتصال را بررسی کنید.';

  @override
  String get dashboard => 'داشبورد';

  @override
  String get simpleMode => 'حالت ساده';

  @override
  String get advancedMode => 'حالت پیشرفته';

  @override
  String get simpleModeDescription =>
      'فقط پروکسی‌ها و وضعیت آن‌ها نمایش داده می‌شود.';

  @override
  String get advancedModeDescription =>
      'مدیریت منابع، پروکسی‌ها و تنظیمات کامل.';

  @override
  String get chooseAppMode => 'نحوه استفاده از برنامه را انتخاب کنید';

  @override
  String get appMode => 'حالت برنامه';

  @override
  String get chooseLanguage => 'زبان برنامه را انتخاب کنید';

  @override
  String get languageDescription => 'زبان مورد استفاده برنامه را انتخاب کنید.';

  @override
  String get tutorialTitle => 'آموزش سریع برنامه';

  @override
  String get tutorialNext => 'بعدی';

  @override
  String get tutorialBack => 'قبلی';

  @override
  String get tutorialFinish => 'پایان';

  @override
  String get tutorialDashboardTitle => 'داشبورد';

  @override
  String get tutorialDashboardDescription =>
      'تعداد کل پروکسی‌ها، پروکسی‌های سالم، منابع و سابقه بررسی‌ها را یکجا ببینید.';

  @override
  String get tutorialProxiesTitle => 'فهرست پروکسی‌ها';

  @override
  String get tutorialProxiesDescription =>
      'جست‌وجو، فیلتر، بررسی سلامت، علاقه‌مندی و باز کردن پروکسی در تلگرام از این بخش انجام می‌شود.';

  @override
  String get tutorialSourcesTitle => 'منابع';

  @override
  String get tutorialSourcesDescription =>
      'منابع پیش‌فرض GitHub را به‌روزرسانی کنید، فایل‌های TXT را همگام کنید، منبع جدید اضافه کنید و عملیات را لغو کنید.';

  @override
  String get tutorialSettingsTitle => 'تنظیمات';

  @override
  String get tutorialSettingsDescription =>
      'زبان، تم، حالت برنامه و مدت نگهداری داده‌ها را تغییر دهید. دکمه‌های به‌روزرسانی و بررسی سلامت progress دارند و قابل لغو هستند.';

  @override
  String get totalProxies => 'همه پروکسی‌ها';

  @override
  String get healthyProxies => 'پروکسی‌های سالم';

  @override
  String get sourceCount => 'منابع';

  @override
  String get checkCount => 'بررسی‌ها';

  @override
  String get cleanup => 'پاک‌سازی داده‌های قدیمی';

  @override
  String cleanupResult(int checks, int proxies) {
    return '$checks نتیجه بررسی و $proxies پروکسی حذف شد.';
  }

  @override
  String get createdWithLove => 'ساخته شده با ❤️ توسط Masoud Mahdian';

  @override
  String get telegramProfile => '@MasoudMahdyan';
}
