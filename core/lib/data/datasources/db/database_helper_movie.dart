// coverage:ignore-file
import 'dart:async';
import 'package:core/utils/encrypt.dart';
import 'package:core/data/models/movie/movie_table.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class DatabaseHelperMovie {
  static DatabaseHelperMovie? _databaseHelperMovie;
  DatabaseHelperMovie._instance() {
    _databaseHelperMovie = this;
  }

  factory DatabaseHelperMovie() =>
      _databaseHelperMovie ?? DatabaseHelperMovie._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblWatchlist = 'watchlist';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath,
        version: 1,
        onCreate: _onCreate,
        password: encrypt('aduhinipasswordsangatsusahsekaliyagaesya'));
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        '''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT
      );
    ''');
  }

  Future<int> insertWatchlist(MovieTable movie) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, movie.toJson());
  }

  Future<int> removeWatchlist(MovieTable movie) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<Map<String, dynamic>?> getMovieById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlistMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWatchlist);

    return results;
  }
}
