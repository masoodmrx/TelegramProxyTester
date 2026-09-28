class ParsedProxy {
  const ParsedProxy({
    required this.server,
    required this.port,
    required this.secret,
    required this.link,
  });
  final String server;
  final int port;
  final String secret;
  final String link;
}

class ProxyParser {
  static List<ParsedProxy> parse(String content) {
    final result = <ParsedProxy>[];
    for (final rawLine in content.split(RegExp(r'\r?\n'))) {
      final line = rawLine.trim().split('#').first.trim();
      if (line.isEmpty) continue;
      final normalized = line.startsWith('tg://proxy')
          ? line
          : line.startsWith('https://t.me/proxy') ||
                line.startsWith('http://t.me/proxy')
          ? line
          : '';
      if (normalized.isEmpty) continue;
      final uri = Uri.tryParse(normalized);
      if (uri == null ||
          uri.queryParameters['server'] == null ||
          uri.queryParameters['port'] == null ||
          uri.queryParameters['secret'] == null) {
        continue;
      }
      final port = int.tryParse(uri.queryParameters['port']!);
      if (port == null || port < 1 || port > 65535) continue;
      result.add(
        ParsedProxy(
          server: uri.queryParameters['server']!,
          port: port,
          secret: uri.queryParameters['secret']!,
          link: normalized,
        ),
      );
    }
    return {
      for (final item in result)
        '${item.server}:${item.port}:${item.secret}': item,
    }.values.toList();
  }
}
