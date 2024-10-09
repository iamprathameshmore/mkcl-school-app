import 'package:client/data/database/sql_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// State model for batches
class BatchState {
  final List<Map<String, dynamic>> batches;
  final bool isLoading;

  BatchState({required this.batches, required this.isLoading});
}

class BatchProvider extends StateNotifier<BatchState> {
  BatchProvider() : super(BatchState(batches: [], isLoading: false)) {
    _loadBatches(); // Load batches when the notifier is created
  }

  final localDB = DataBaseSql.getInstance;

  // Load batches from database
  Future<void> _loadBatches() async {
    state = BatchState(batches: state.batches, isLoading: true);
    final batchData = await localDB.getAllData();
    final List<Map<String, dynamic>> batchNames =
        List<Map<String, dynamic>>.from(batchData);
    state = BatchState(batches: batchNames, isLoading: false);
  }

  // Add a single batch
  Future<void> addBatch({
    required String titlenew,
    required String descnew,
    required String startDatenew,
    required String endDatenew,
    required String startTimenew,
    required String endTimenew,
  }) async {
    await localDB.addBatch(
        title: titlenew,
        desc: descnew,
        startDate: startDatenew,
        endDate: endDatenew,
        startTime: startTimenew,
        endTime: endTimenew);
    _loadBatches(); // Reload batches after insert
  }
}

// Define the provider for BatchNotifier
final batchProvider = StateNotifierProvider<BatchProvider, BatchState>((ref) {
  return BatchProvider();
});
