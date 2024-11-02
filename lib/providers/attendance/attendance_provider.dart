import 'package:client/data/helpers/attendance_database_helper.dart';
import 'package:client/data/helpers/students_database_helper.dart';
import 'package:client/data/model/studentModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/data/model/attendanceModel.dart';
import 'package:client/data/local_database/local_database_helper.dart';

// Create a provider for LocalDatabaseHelper
final localDatabaseProvider = Provider<LocalDatabaseHelper>((ref) {
  return LocalDatabaseHelper(); // Ensure proper initialization
});

// Create a provider for AttendanceDatabaseHelper
final attendanceDatabaseProvider = Provider<AttendanceDatabaseHelper>((ref) {
  final localDb =
      ref.read(localDatabaseProvider); // Read the LocalDatabaseHelper provider
  return AttendanceDatabaseHelper(
      localDb); // Initialize AttendanceDatabaseHelper
});

// Create a StateNotifier to manage attendance state
class AttendanceNotifier extends StateNotifier<List<AttendanceModel>> {
  final AttendanceDatabaseHelper _attendanceDatabaseHelper;

  AttendanceNotifier(this._attendanceDatabaseHelper) : super([]);

  // Load attendance records for a specific batch
  Future<void> loadAttendanceForBatch(int batchId) async {
    try {
      final attendanceList =
          await _attendanceDatabaseHelper.getAttendanceForBatch(batchId);
      state = attendanceList; // Update the state
    } catch (e) {
      print("Error loading attendance: $e"); // Handle errors appropriately
    }
  }

  // Insert a new attendance record
  Future<void> addAttendance(AttendanceModel attendance) async {
    try {
      await _attendanceDatabaseHelper.insertAttendance(attendance);
      await loadAttendanceForBatch(
          attendance.batchId!); // Refresh the list after adding
    } catch (e) {
      print("Error adding attendance: $e"); // Handle errors appropriately
    }
  }

  // Insert multiple attendance records
  Future<void> addMultipleAttendance(
      List<AttendanceModel> attendanceList) async {
    try {
      await _attendanceDatabaseHelper.insertManyAttendance(attendanceList);
      await loadAttendanceForBatch(
          attendanceList.first.batchId); // Refresh the list after adding
    } catch (e) {
      print(
          "Error adding multiple attendance: $e"); // Handle errors appropriately
    }
  }
}

// Create a StateNotifierProvider for AttendanceNotifier
final attendanceProvider = StateNotifierProvider.family<AttendanceNotifier,
    List<AttendanceModel>, int>((ref, batchId) {
  final databaseHelper = ref.read(attendanceDatabaseProvider);
  return AttendanceNotifier(databaseHelper)
    ..loadAttendanceForBatch(
        batchId); // Load attendance when the provider is created
});
