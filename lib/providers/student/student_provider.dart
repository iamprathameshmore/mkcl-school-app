import 'package:client/data/local_database/local_database_helper.dart';
import 'package:client/data/helpers/students_database_helper.dart';
import 'package:client/data/model/studentModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// StateNotifier to manage a list of students
class StudentListNotifier extends StateNotifier<List<StudentModel>> {
  final StudentDatabaseHelper _dbFunctions;
  final int batchId;
  // Constructor initializes the state and loads students from the database
  StudentListNotifier(this._dbFunctions, this.batchId) : super([]) {
    _loadStudents(batchId);
  }

  // Method to load students from the database
  Future<void> _loadStudents(int batchId) async {
    try {
      // Load students and update the state
      state = await _dbFunctions.getStudents(batchId);
    } catch (e) {
      print("Error loading students: $e");
    }
  }

  // Method to add a new student
  Future<void> addStudent(String name, int studentId, int batchId) async {
    try {
      final newStudent =
          StudentModel(name: name, batchId: batchId, studentId: studentId);
      await _dbFunctions.insertStudent(newStudent);
      // Update the state by adding the new student
      state = [...state, newStudent];
    } catch (e) {
      print("Error adding student: $e");
    }
  }

  // Method to delete a student by ID
  Future<void> deleteStudent(int studentId) async {
    try {
      await _dbFunctions.deleteStudent(studentId);
      // Refresh the student list to ensure it's in sync
      state = state.where((student) => student.studentId != studentId).toList();
    } catch (e) {
      print("Error deleting student: $e");
    }
  }
}

// Provider for managing the student list state
final studentListProvider =
    StateNotifierProvider.family<StudentListNotifier, List<StudentModel>, int>(
        (ref, batchId) {
  final localDatabaseHelper =
      LocalDatabaseHelper(); // Create an instance of LocalDatabaseHelper
  final dbHelper = StudentDatabaseHelper(
      batchId, localDatabaseHelper); // Pass it to the database helper
  return StudentListNotifier(dbHelper, batchId);
});
