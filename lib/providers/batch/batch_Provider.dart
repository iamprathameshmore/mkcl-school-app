import 'package:client/data/helpers/batchs_database_helper.dart';
import 'package:client/data/model/batchModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// State model for batches with copyWith
class BatchState {
  final List<BatchModel> batches;
  final bool isLoading;

  BatchState({required this.batches, required this.isLoading});

  // CopyWith for immutability and optimized state updates
  BatchState copyWith({List<BatchModel>? batches, bool? isLoading}) {
    return BatchState(
      batches: batches ?? this.batches,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class BatchProvider extends StateNotifier<BatchState> {
  BatchProvider() : super(BatchState(batches: [], isLoading: false)) {
    _loadBatches(); // Load batches when the notifier is created
  }

  final BatchDatabaseHelper localDB = BatchDatabaseHelper();

  // Load batches from the database
  Future<void> _loadBatches() async {
    state = state.copyWith(isLoading: true);
    try {
      final batchData = await localDB.getAllBatches();
      state = state.copyWith(batches: batchData, isLoading: false);
    } catch (e) {
      print('Error loading batches: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  // Add a single batch
  Future<void> addBatch({
    required String titlenew,
    required String startDatenew,
    required String endDatenew,
    required String startTimenew,
    required String endTimenew,
  }) async {
    try {
      // Create a Batch object
      BatchModel newBatch = BatchModel(
        title: titlenew,
        startDate: startDatenew,
        endDate: endDatenew,
        startTime: startTimenew,
        endTime: endTimenew,
      );

      // Insert the Batch object into the database
      await localDB.insertBatch(newBatch);

      // Reload batches after insert
      await _loadBatches();
    } catch (e) {
      print('Error adding batch: $e');
    }
  }
}

// Define the provider for BatchProvider
final batchProvider = StateNotifierProvider<BatchProvider, BatchState>((ref) {
  return BatchProvider();
});
