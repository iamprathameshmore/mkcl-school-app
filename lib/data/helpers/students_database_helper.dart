import 'package:client/data/local_database/local_database_helper.dart';
import 'package:client/data/model/studentModel.dart';
import 'package:sqflite/sqflite.dart';

class StudentDatabaseHelper {
  final LocalDatabaseHelper
      _dbHelper; // Accepting an instance of LocalDatabaseHelper
  final int batchId; // Store the batch ID

  // Constructor to initialize batchId and database helper
  StudentDatabaseHelper(this.batchId, this._dbHelper);

  // Method to insert a student into the database
  Future<void> insertStudent(StudentModel student) async {
    try {
      final db = await _dbHelper.database;
      final studentData = student.toMap(); // Convert the student model to a map

      // Perform the insertion
      await db.insert(
        'Student',
        studentData,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      // Handle error during insertion
      print("Error inserting student: $e");
      throw Exception(
          "Failed to insert student"); // Optional: rethrow for higher-level handling
    }
  }

  // Method to retrieve all students from the database based on batchId
  Future<List<StudentModel>> getStudents(int batchId) async {
    try {
      final db = await _dbHelper.database;

      // Use batchId in the where clause safely
      final List<Map<String, dynamic>> maps = await db.query(
        'Student',
        where: 'batch_id = ?',
        whereArgs: [batchId], // Use the instance variable directly
      );

      // Convert the list of maps to a list of StudentModel instances
      return List.generate(maps.length, (i) {
        return StudentModel.fromMap(maps[i]);
      });
    } catch (e) {
      // Handle error during retrieval
      print("Error retrieving students: $e");
      throw Exception(
          "Failed to retrieve students"); // Optional: rethrow for higher-level handling
    }
  }

  // Method to delete a student by ID
  Future<void> deleteStudent(int id) async {
    try {
      final db = await _dbHelper.database;
      await db.delete(
        'Student',
        where: 'student_id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      // Handle error during deletion
      print("Error deleting student: $e");
      throw Exception(
          "Failed to delete student"); // Optional: rethrow for higher-level handling
    }
  }
}
