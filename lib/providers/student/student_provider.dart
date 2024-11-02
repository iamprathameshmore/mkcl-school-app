import 'package:client/data/helpers/students_database_helper.dart';
import 'package:client/data/model/studentModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StudentListNotifier extends StateNotifier<List<StudentModel>> {
  final StudentDatabaseHelper _dbFunctions;

  // Constructor initializes the state and loads students from the database
  StudentListNotifier(this._dbFunctions) : super([]) {
    // Automatically load students for the batch when the notifier is created
    _loadStudents();
  }

  // Method to load students from the database
  Future<void> _loadStudents() async {
    try {
      // Call getStudents with the batchId parameter
      state = await _dbFunctions.getStudents(_dbFunctions.batchId);
    } catch (e) {
      // Handle any exceptions or errors
      print("Error loading students: $e");
    }
  }

  // Method to add a new student
  Future<void> addStudent(String name, int batchId, int studentId) async {
    try {
      final newStudent =
          StudentModel(name: name, batchId: batchId, studentId: studentId);
      await _dbFunctions.insertStudent(newStudent);
      // Update the state by adding the new student
      state = [...state, newStudent];
    } catch (e) {
      // Handle any exceptions or errors during insertion
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
      // Handle any exceptions or errors during deletion
      print("Error deleting student: $e");
    }
  }
}

// Provider for managing the student list state
final studentListProvider =
    StateNotifierProvider.family<StudentListNotifier, List<StudentModel>, int>(
        (ref, batchId) {
  final dbHelper =
      StudentDatabaseHelper(batchId); // Pass batchId to the database helper
  return StudentListNotifier(dbHelper);
});
