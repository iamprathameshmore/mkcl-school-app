import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseSql {
  DataBaseSql._();

  static final DataBaseSql getInstance = DataBaseSql._();

  Database? localDB;

  static final String TABLE_NAME = 'Batch';
  static final String COL_SNO = 's_no';
  static final String COL_TITLE = 'title';
  static final String COL_DES = 'desc';
  static final String COL_START_DATE = 'start_date';
  static final String COL_END_DATE = 'end_date';
  static final String COL_START_TIME = 'start_time';
  static final String COL_END_TIME = 'end_time';

  Future<Database> getDB() async {
    if (localDB != null) {
      return localDB!;
    } else {
      localDB = await openDB();
      return localDB!;
    }
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationCacheDirectory();
    String dbPath = join(appDir.path, 'mkcl.db');

    return await openDatabase(dbPath, onCreate: (db, version) {
      db.execute('''create table $TABLE_NAME (
          $COL_SNO integer primary key autoincrement, 
          $COL_TITLE text, 
          $COL_DES text, 
          $COL_START_DATE text, 
          $COL_END_DATE text, 
          $COL_START_TIME text,  
          $COL_END_TIME text 
          )''');
    }, version: 2);
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    var db = await getDB();

    List<Map<String, dynamic>> allBatches = await db.query(TABLE_NAME);
    return allBatches;
  }

  Future<int> addBatch(
      {required String title,
      required String desc,
      required String startDate,
      required String endDate,
      required String startTime,
      required String endTime}) async {
    var db = await getDB();

    return await db.insert(TABLE_NAME, {
      COL_TITLE: title,
      COL_DES: desc,
      COL_START_DATE: startDate,
      COL_END_DATE: endDate,
      COL_START_TIME: startTime,
      COL_END_TIME: endTime,
    });
  }
}
