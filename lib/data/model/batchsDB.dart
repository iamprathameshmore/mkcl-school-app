import 'package:client/data/database/database_helper.dart';

class BatchDatabase {
  Future<List<Map<String, dynamic>>> getAllBatches() async {
    final db = await DatabaseHelper.instance.database;
    return await db.query('Batch');
  }

  Future<int> addBatch(
      {required String title,
      required String desc,
      required String startDate,
      required String endDate,
      required String startTime,
      required String endTime}) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('Batch', {
      'title': title,
      'desc': desc,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime,
    });
  }
}
