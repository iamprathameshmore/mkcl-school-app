import 'package:client/data/local_database/local_database_helper.dart';
import 'package:client/data/model/attendanceModel.dart'; // Ensure you have a model for Attendance
import 'package:sqflite/sqflite.dart';

class AttendanceDatabaseHelper {
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  // Insert a new attendance record
  Future<void> insertAttendance(AttendanceModel attendance) async {
    final db = await _dbHelper.database;
    await db.insert('Attendance', attendance.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Retrieve all attendance records
  Future<List<AttendanceModel>> getAttendance() async {
    final db = await _dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('Attendance');

    return List.generate(maps.length, (i) {
      return AttendanceModel.fromJson(maps[i]);
    });
  }

  // Delete an attendance record by attendance_id
  Future<void> deleteAttendance(int attendanceId) async {
    final db = await _dbHelper.database;
    await db.delete('Attendance',
        where: 'attendance_id = ?', whereArgs: [attendanceId]);
  }
}
