import 'package:client/data/database/database_helper.dart';

class UserDatabase {
  // Get all users
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await DatabaseHelper.instance.database;
    return await db.query('User');
  }

  // Add a new user
  Future<int> addUser(
      {required String name,
      required String email,
      required String phone,
      required String password}) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('User',
        {'name': name, 'email': email, 'phone': phone, 'password': password});
  }

  // Check if a user exists for sign-in
  Future<Map<String, dynamic>?> signIn({
    required String email,
    required String password,
  }) async {
    final db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'User',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null; // Return null if user not found
  }

  // Retrieve user details by email
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await DatabaseHelper.instance.database;
    List<Map<String, dynamic>> result = await db.query(
      'User',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return result.first;
    }
    return null; // Return null if user not found
  }

  // Update user password (for forgot password)
  Future<int> updateUserPassword({
    required String email,
    required String newPassword,
  }) async {
    final db = await DatabaseHelper.instance.database;
    return await db.update(
      'User',
      {'password': newPassword},
      where: 'email = ?',
      whereArgs: [email],
    );
  }
}
