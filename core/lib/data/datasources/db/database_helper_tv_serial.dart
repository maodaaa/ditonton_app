import 'dart:async';
import 'package:core/utils/encrypt.dart';
import 'package:core/data/models/tv/tv_table.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelperTvSerial {
  static DatabaseHelperTvSerial? _databaseHelperTvSerial;
  DatabaseHelperTvSerial._instance() {
    _databaseHelperTvSerial = this;
  }

  factory DatabaseHelperTvSerial() =>
      _databaseHelperTvSerial ?? DatabaseHelperTvSerial._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchlistTvSerial = 'watchlisttvserial';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/tvserial.db';

    var db = await openDatabase(databasePath,
        version: 1,
        onCreate: _onCreate,
        password: encrypt('aduhinipasswordsangatsusahsekaliyagaesya'));
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE  $_tblWatchlistTvSerial (
        id INTEGER PRIMARY KEY,
        name TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertWatchlistTvSerial(TvSerialTable tvSerial) async {
    final db = await database;
    return await db!.insert(_tblWatchlistTvSerial, tvSerial.toJson());
  }

  Future<int> removeWatchlistTvSerial(TvSerialTable tvSerial) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlistTvSerial,
      where: 'id = ?',
      whereArgs: [tvSerial.id],
    );
  }

  Future<Map<String, dynamic>?> getTvSerialById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlistTvSerial,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistTvSerials() async {
    final db = await database;
    final List<Map<String, dynamic>> results =
        await db!.query(_tblWatchlistTvSerial);

    return results;
  }
}
