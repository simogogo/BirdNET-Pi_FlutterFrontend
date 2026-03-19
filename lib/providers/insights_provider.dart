import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

class InsightsFilter {
  final String period;
  final DateTimeRange? range;

  InsightsFilter({required this.period, this.range});
}

class InsightsPeriodNotifier extends Notifier<InsightsFilter> {
  @override
  InsightsFilter build() {
    return InsightsFilter(period: '30d');
  }

  set state(InsightsFilter value) => super.state = value;
}

final insightsPeriodProvider = NotifierProvider<InsightsPeriodNotifier, InsightsFilter>(() {
  return InsightsPeriodNotifier();
});

/// Provider asincrono per i dati di Insights correlati al periodo
final insightsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final filter = ref.watch(insightsPeriodProvider);
  final apiService = ref.watch(apiServiceProvider);
  
  if (filter.period == 'custom' && filter.range != null) {
    final start = filter.range!.start.toIso8601String().substring(0, 10);
    final end = filter.range!.end.toIso8601String().substring(0, 10);
    return apiService.getInsights(period: 'custom', startDate: start, endDate: end);
  }
  return apiService.getInsights(period: filter.period);
});


