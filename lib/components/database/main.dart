import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Future<Database> getDB() {
    return openDatabase(
      'local.db',
      version: 1,
      onCreate: (Database db, int version) {
        db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, isDone INTEGER)',
        );
      },
    );
  }
}
