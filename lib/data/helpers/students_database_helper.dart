import 'package:client/data/local_database/local_database_helper.dart';
import 'package:client/data/model/studentModel.dart';
import 'package:sqflite/sqflite.dart';

class StudentDatabaseHelper {
  final int batchId; // Store the batch ID
  final LocalDatabaseHelper _dbHelper = LocalDatabaseHelper();

  // Constructor to initialize batchId
  StudentDatabaseHelper(this.batchId);

  // Method to insert a student into the database
  Future<void> insertStudent(StudentModel student) async {
    final db = await _dbHelper.database;

    // Convert the student model to a map using the toMap method
    final studentData = student.toMap();

    // Perform the insertion
    await db.insert(
      'Student',
      studentData,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Method to retrieve all students from the database based on batchId
  Future<List<StudentModel>> getStudents(int batchId) async {
    final db = await _dbHelper.database;

    // Use batchId in the where clause safely
    final List<Map<String, dynamic>> maps = await db.query(
      'Student',
      where: 'batch_id = ?',
      whereArgs: [
        batchId
      ], // Use a parameterized query to prevent SQL injection
    );

    // Convert the list of maps to a list of StudentModel instances
    return List.generate(maps.length, (i) {
      return StudentModel.fromMap(maps[i]);
    });
  }

  // Method to delete a student by ID
  Future<void> deleteStudent(int id) async {
    final db = await _dbHelper.database;
    await db.delete(
      'Student',
      where: 'student_id = ?',
      whereArgs: [id],
    );
  }
}
