import 'package:sqflite/sqflite.dart';

late Database _db;
Future<void> initializeDataBase() async {
  try {
    _db = await openDatabase(
      "projects.db",
      version: 1,
      onCreate: (db, version) {
        db.execute("""
    CREATE TABLE projects (
     id INTEGER PRIMARY KEY,
     project_name TEXT,
     project_id TEXT,
     section_1 TEXT,
     section_2 TEXT,
     section_3 TEXT,
     section_4 TEXT,
     section_5 TEXT,
     section_6 TEXT,
     section_7 TEXT,
     section_8 TEXT,
     section_9 TEXT,
     section_10 TEXT,
     section_11 TEXT,
     section_12 TEXT,
     section_13 TEXT,
     section_14 TEXT,
     section_15 TEXT,
     section_16 TEXT,
     section_17 TEXT,
     section_18 TEXT)
     """);
      },
    );

    /// remove this print later
    print("created database");
  } catch (e) {
    print("EC - while creating table as $e");
    throw e;
  }
}
