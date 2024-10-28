import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, 'main.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        // Initialize tables here
        await db.execute('''
          CREATE TABLE Batch (
            s_no INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            desc TEXT,
            start_date TEXT,
            end_date TEXT,
            start_time TEXT,
            end_time TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE User (
            user_id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT UNIQUE,
            phone TEXT,
            password TEXT,
          )
        ''');

        // Create Student table with a foreign key reference to Batch
        await db.execute('''
          CREATE TABLE Student (
            student_id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            batch_id INTEGER,
            FOREIGN KEY (batch_id) REFERENCES Batch (s_no) ON DELETE CASCADE
          )
        ''');
      },
    );
  }
}
