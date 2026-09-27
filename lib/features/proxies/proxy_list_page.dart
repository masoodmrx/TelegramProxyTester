import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/database/app_database.dart';
import '../../core/localization/app_strings.dart';
import '../../domain/proxy_models.dart';
import '../../data/health/proxy_health_service.dart';

class ProxyListPage extends StatefulWidget {
  const ProxyListPage({required this.database, super.key});
  final AppDatabase database;

  @override
  State<ProxyListPage> createState() => _ProxyListPageState();
}

class _ProxyListPageState extends State<ProxyListPage> {
  static const pageSize = 25;
  int _page = 0;
  ProxyPage _result = const ProxyPage([], 0);
  final _searchController = TextEditingController();
  bool _onlyReachable = false;
  bool _onlyFavorites = false;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _reload() async {
    final result = await widget.database.proxiesPage(limit: pageSize, offset: _page * pageSize, search: _searchController.text, onlyReachable: _onlyReachable, onlyFavorites: _onlyFavorites);
    if (mounted) setState(() => _result = result);
  }

  Future<void> _checkHealth() async {
    final strings = AppStrings.of(context);
    final count = await ProxyHealthService(widget.database).checkAll();
    await _reload();
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(strings.healthResult(count))));
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    final maxPage = _result.total == 0 ? 0 : (_result.total - 1) ~/ pageSize;
    return Column(children: [
      Padding(padding: const EdgeInsets.all(16), child: Row(children: [
        Expanded(child: Text(strings.proxyList, style: Theme.of(context).textTheme.headlineSmall)),
        IconButton(onPressed: _checkHealth, tooltip: strings.checkHealth, icon: const Icon(Icons.health_and_safety)),
        IconButton(onPressed: () { _reload(); }, tooltip: strings.refresh, icon: const Icon(Icons.refresh)),
      ])),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(children: [
        Expanded(child: TextField(controller: _searchController, onSubmitted: (_) { _page = 0; _reload(); }, decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText: strings.search, border: const OutlineInputBorder()))),
        const SizedBox(width: 8),
        FilterChip(label: Text(strings.healthyOnly), selected: _onlyReachable, onSelected: (value) { setState(() { _onlyReachable = value; _page = 0; }); _reload(); }),
        const SizedBox(width: 8),
        FilterChip(label: Text(strings.favorites), selected: _onlyFavorites, onSelected: (value) { setState(() { _onlyFavorites = value; _page = 0; }); _reload(); }),
      ])),
      Expanded(child: _result.items.isEmpty ? Center(child: Text(strings.noProxies)) : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16), itemCount: _result.items.length,
        itemBuilder: (context, index) => ProxyCard(record: _result.items[index], onFavoriteChanged: (value) async { await widget.database.toggleFavorite(_result.items[index].id, value); _reload(); }),
      )),
      Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 16), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(onPressed: _page > 0 ? () { _page--; _reload(); } : null, icon: const Icon(Icons.chevron_left)),
        Text('${_page + 1} / ${maxPage + 1}'),
        IconButton(onPressed: _page < maxPage ? () { _page++; _reload(); } : null, icon: const Icon(Icons.chevron_right)),
      ])),
    ]);
  }
}

class ProxyCard extends StatelessWidget {
  const ProxyCard({required this.record, required this.onFavoriteChanged, super.key});
  final ProxyRecord record;
  final ValueChanged<bool> onFavoriteChanged;

  @override
  Widget build(BuildContext context) {
    final strings = AppStrings.of(context);
    return Card(child: ListTile(
      leading: Icon(Icons.shield, color: record.lastStatus == 'reachable' ? Colors.green : Colors.grey),
      title: Text('${record.server}:${record.port}'),
      subtitle: Text(record.lastLatencyMs == null ? strings.notChecked : '${record.lastLatencyMs} ms'),
      trailing: Wrap(spacing: 4, children: [
        IconButton(onPressed: () => onFavoriteChanged(!record.isFavorite), icon: Icon(record.isFavorite ? Icons.star : Icons.star_border)),
        FilledButton.tonal(onPressed: () => launchUrl(Uri.parse(record.originalLink), mode: LaunchMode.externalApplication), child: Text(strings.open)),
      ]),
      onTap: () => showDialog<void>(context: context, builder: (context) => AlertDialog(title: Text('${record.server}:${record.port}'), content: SelectableText(record.originalLink), actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text(strings.close))])),
    ));
  }
}
