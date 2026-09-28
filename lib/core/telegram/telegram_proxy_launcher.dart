import 'package:url_launcher/url_launcher.dart';

/// Opens a Telegram MTProto proxy link in the Telegram application.
class TelegramProxyLauncher {
  const TelegramProxyLauncher._();

  static Uri? telegramUriFromLink(String link) {
    final source = Uri.tryParse(link);
    if (source == null) return null;

    final server = source.queryParameters['server'];
    final port = source.queryParameters['port'];
    final secret = source.queryParameters['secret'];
    if (server == null || port == null || secret == null) return null;

    return Uri(
      scheme: 'tg',
      host: 'proxy',
      queryParameters: {'server': server, 'port': port, 'secret': secret},
    );
  }

  static Future<bool> open(String link) async {
    final telegramUri = telegramUriFromLink(link);
    if (telegramUri == null) return false;

    try {
      return await launchUrl(telegramUri, mode: LaunchMode.externalApplication);
    } catch (_) {
      return false;
    }
  }

  static Future<bool> openProfile(String username) async {
    final normalized = username.replaceFirst('@', '').trim();
    if (normalized.isEmpty) return false;

    final telegramUri = Uri(
      scheme: 'tg',
      host: 'resolve',
      queryParameters: {'domain': normalized},
    );
    try {
      if (await launchUrl(telegramUri, mode: LaunchMode.externalApplication)) {
        return true;
      }
      return await launchUrl(
        Uri.https('t.me', normalized),
        mode: LaunchMode.externalApplication,
      );
    } catch (_) {
      return false;
    }
  }
}
