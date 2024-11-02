// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class LocalDatabaseHelper {
//   LocalDatabaseHelper._();
//   static final LocalDatabaseHelper instance = LocalDatabaseHelper._();

//   static Database? _database;

//   factory LocalDatabaseHelper() => instance;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     Directory appDir = await getApplicationDocumentsDirectory();
//     String dbPath = join(appDir.path, 'mkcl_sqlite.db');

//     return await openDatabase(
//       dbPath,
//       version: 1,
//       onCreate: (db, version) async {
//         // Creating Batch table
//         await db.execute('''
//     CREATE TABLE Batch (
//       s_no INTEGER PRIMARY KEY AUTOINCREMENT,
//       title TEXT NOT NULL,
//       start_date TEXT,
//       end_date TEXT,
//       start_time TEXT,
//       end_time TEXT
//     )
//   ''');

//         // Creating Student table with a foreign key reference to Batch
//         await db.execute('''
//     CREATE TABLE Student (
//       student_id INTEGER PRIMARY KEY AUTOINCREMENT,
//       name TEXT NOT NULL,
//       batch_id INTEGER,
//       FOREIGN KEY (batch_id) REFERENCES Batch(s_no) ON DELETE CASCADE
//     )
//   ''');

//         // Creating Attendance table
//         await db.execute('''
//     CREATE TABLE Attendance (
//       attendance_id INTEGER PRIMARY KEY AUTOINCREMENT,
//       student_id INTEGER,
//       batch_id INTEGER,
//       attendance_date TEXT NOT NULL,
//       status TEXT CHECK(status IN ('Present', 'Absent', 'Late', 'Excused')) DEFAULT 'Absent',
//       FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
//       FOREIGN KEY (batch_id) REFERENCES Batch(batch_id) ON DELETE CASCADE
//     )
// ''');
//       },
//       onOpen: (db) async {
//         // Enable foreign key support
//         await db.execute('PRAGMA foreign_keys = ON;');
//       },
//     );
//   }

//   Future<void> close() async {
//     if (_database != null) {
//       await _database!.close();
//       _database = null;
//     }
//   }
// }
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabaseHelper {
  LocalDatabaseHelper._();
  static final LocalDatabaseHelper instance = LocalDatabaseHelper._();

  static Database? _database;

  factory LocalDatabaseHelper() => instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, 'mkcl_sqlite.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        // Creating Batch table
        await db.execute('''
          CREATE TABLE Batch (
            s_no INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            start_date TEXT,
            end_date TEXT,
            start_time TEXT,
            end_time TEXT
          )
        ''');

        // Creating Student table with a foreign key reference to Batch
        await db.execute('''
          CREATE TABLE Student (
            student_id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            batch_id INTEGER,
            FOREIGN KEY (batch_id) REFERENCES Batch(s_no) ON DELETE CASCADE
          )
        ''');

        // Creating Attendance table with the correct foreign key references
        await db.execute('''
          CREATE TABLE Attendance (
            attendance_id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER,
            batch_id INTEGER,
            attendance_date TEXT NOT NULL,
            status TEXT CHECK(status IN ('Present', 'Absent', 'Late', 'Excused')) DEFAULT 'Absent',
            FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
            FOREIGN KEY (batch_id) REFERENCES Batch(s_no) ON DELETE CASCADE
          )
        ''');
      },
      onOpen: (db) async {
        // Enable foreign key support
        await db.execute('PRAGMA foreign_keys = ON;');
      },
    );
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
