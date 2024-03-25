import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper = DatabaseHelper._createInstance();
  static Database? _database;

  String scoreTable = 'score_table';
  String colId = 'id';
  String colName = 'name';
  String colScore = 'score';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'scores.db');
    var scoresDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return scoresDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $scoreTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colScore INTEGER)');
  }

  // Insertion
  Future<int> insertScore(Map<String, dynamic> scoreMap) async {
    Database db = await database;
    int result = await db.insert(scoreTable, scoreMap);
    return result;
  }

  // Récupération de tous les scores
  Future<List<Map<String, dynamic>>> getScoreMapList() async {
    Database db = await database;
    var result = await db.query(scoreTable, orderBy: '$colScore DESC');
    return result;
  }
}
