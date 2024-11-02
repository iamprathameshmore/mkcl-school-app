// batch_database_helper.dart
import 'package:client/data/local_database/local_database_helper.dart';
import 'package:client/data/model/batchModel.dart';

class BatchDatabaseHelper {
  // Insert a new batch
  Future<int> insertBatch(BatchModel batchData) async {
    try {
      final db = await LocalDatabaseHelper.instance.database;
      return await db.insert('Batch', batchData.toMap());
    } catch (e) {
      print('Error inserting batch: $e');
      return -1; // Return -1 or handle as appropriate
    }
  }

  // Retrieve all batches
  Future<List<BatchModel>> getAllBatches() async {
    try {
      final db = await LocalDatabaseHelper.instance.database;
      final List<Map<String, dynamic>> maps = await db.query('Batch');
      // Convert the List<Map<String, dynamic>> to List<Batch>
      return List.generate(maps.length, (i) {
        return BatchModel.fromMap(maps[i]);
      });
    } catch (e) {
      print('Error retrieving batches: $e');
      return []; // Return an empty list or handle as appropriate
    }
  }

  // Update a batch
  Future<int> updateBatch(BatchModel batchData) async {
    try {
      final db = await LocalDatabaseHelper.instance.database;
      return await db.update(
        'Batch',
        batchData.toMap(),
        where: 's_no = ?',
        whereArgs: [batchData.sNo],
      );
    } catch (e) {
      print('Error updating batch: $e');
      return -1; // Return -1 or handle as appropriate
    }
  }

  // Delete a batch
  Future<int> deleteBatch(int id) async {
    try {
      final db = await LocalDatabaseHelper.instance.database;
      return await db.delete(
        'Batch',
        where: 's_no = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting batch: $e');
      return -1; // Return -1 or handle as appropriate
    }
  }
}
