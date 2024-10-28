import 'package:client/data/database/database_helper.dart';

class StudentDatabase {
  Future<List<Map<String, dynamic>>> getAllStudents() async {
    final db = await DatabaseHelper.instance.database;
    return await db.query('Student');
  }

  Future<int> addStudent(
      {required String name,
      required String email,
      required int batchId}) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('Student', {
      'name': name,
      'batch_id': batchId,
    });
  }

  Future<List<Map<String, dynamic>>> getStudentsByBatchId(int batchId) async {
    final db = await DatabaseHelper.instance.database;
    return await db
        .query('Student', where: 'batch_id = ?', whereArgs: [batchId]);
  }
}
