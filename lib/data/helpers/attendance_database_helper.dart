import 'package:client/data/local_database/local_database_helper.dart';
import 'package:client/data/model/attendanceModel.dart';
import 'package:sqflite/sqflite.dart';

class AttendanceDatabaseHelper {
  final LocalDatabaseHelper _dbHelper;

  AttendanceDatabaseHelper(
      this._dbHelper); // Accepting an instance of LocalDatabaseHelper

  // Insert a new attendance record
  Future<void> insertAttendance(AttendanceModel attendance) async {
    try {
      final db = await _dbHelper.database;
      await db.insert('Attendance', attendance.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      // Handle the error (e.g., log it)
      print("Error inserting attendance: $e");
    }
  }

  // Load attendance records for a specific batch
  Future<List<AttendanceModel>> getAttendanceForBatch(int batchId) async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'Attendance',
      where: 'batch_id = ?',
      whereArgs: [batchId],
    );

    return List.generate(maps.length, (i) {
      return AttendanceModel.fromJson(maps[i]);
    });
  }

  Future<void> insertManyAttendance(
      List<AttendanceModel> attendanceList) async {
    final db = await _dbHelper.database;

    // Use a batch for bulk insert
    final batch = db.batch();

    try {
      for (var attendance in attendanceList) {
        batch.insert('Attendance', attendance.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }

      await batch.commit(noResult: true);
    } catch (e) {
      // Handle any errors that occur during batch insertion
      print("Error inserting multiple attendance records: $e");
    }
  }
}
