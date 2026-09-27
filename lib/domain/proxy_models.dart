class ProxyRecord {
  const ProxyRecord({required this.id, required this.server, required this.port, required this.originalLink, this.lastStatus, this.lastLatencyMs, this.isFavorite = false});
  final int id;
  final String server;
  final int port;
  final String originalLink;
  final String? lastStatus;
  final int? lastLatencyMs;
  final bool isFavorite;
}

class SourceFileRecord {
  const SourceFileRecord({required this.url, required this.sourceType, this.validationStatus});
  final String url;
  final String sourceType;
  final String? validationStatus;
}

class ProxyPage {
  const ProxyPage(this.items, this.total);
  final List<ProxyRecord> items;
  final int total;
}

class ProxyCheckTarget {
  const ProxyCheckTarget({required this.id, required this.server, required this.port});
  final int id;
  final String server;
  final int port;
}
