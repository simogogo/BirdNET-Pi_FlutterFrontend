import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

// Record for arguments
typedef TrendsArgs = ({String species, String? startDate, String? endDate});

final trendsDataProvider = FutureProvider.autoDispose
    .family<Map<String, dynamic>, TrendsArgs>((ref, args) async {
  final api = ref.watch(apiServiceProvider);
  return api.getTrends(
    species: args.species,
    startDate: args.startDate,
    endDate: args.endDate,
  );
});
