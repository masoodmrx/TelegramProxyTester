import 'package:flutter/material.dart';

import '../../core/database/app_database.dart';
import '../../l10n/app_localizations.dart';
import '../../domain/proxy_models.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({required this.database, super.key});
  final AppDatabase database;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<DashboardStats> _stats;

  @override
  void initState() {
    super.initState();
    _reload();
  }

  void _reload() => _stats = widget.database.dashboardStats();

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context)!;
    return RefreshIndicator(
      onRefresh: () async => setState(_reload),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  strings.dashboard,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              IconButton(
                onPressed: () => setState(_reload),
                tooltip: strings.refresh,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FutureBuilder<DashboardStats>(
            future: _stats,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.hasError) return Text(snapshot.error.toString());
              final stats = snapshot.data!;
              return GridView.count(
                crossAxisCount: MediaQuery.sizeOf(context).width >= 700 ? 4 : 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  _StatCard(
                    icon: Icons.public,
                    label: strings.totalProxies,
                    value: stats.proxies.toString(),
                  ),
                  _StatCard(
                    icon: Icons.check_circle,
                    label: strings.healthyProxies,
                    value: stats.healthy.toString(),
                    color: Colors.green,
                  ),
                  _StatCard(
                    icon: Icons.source,
                    label: strings.sourceCount,
                    value: stats.sources.toString(),
                  ),
                  _StatCard(
                    icon: Icons.history,
                    label: strings.checkCount,
                    value: stats.checks.toString(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.color,
  });
  final IconData icon;
  final String label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color ?? Theme.of(context).colorScheme.primary),
          const SizedBox(height: 6),
          Text(value, style: Theme.of(context).textTheme.titleLarge),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
