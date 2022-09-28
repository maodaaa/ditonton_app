import 'package:core/utils/exception.dart';
import 'package:core/data/datasources/db/database_helper_tv_serial.dart';
import 'package:core/data/models/tv/tv_table.dart';

abstract class TvSerialLocalDataSource {
  Future<String> insertWatchlistTvSerial(TvSerialTable tv);
  Future<String> removeWatchlistTvSerial(TvSerialTable tv);
  Future<TvSerialTable?> getTvSerialById(int id);
  Future<List<TvSerialTable>> getWatchlistTvSerials();
}

class TvSerialLocalDataSourceImpl implements TvSerialLocalDataSource {
  final DatabaseHelperTvSerial databaseHelperTvSerial;

  TvSerialLocalDataSourceImpl({required this.databaseHelperTvSerial});

  @override
  Future<String> insertWatchlistTvSerial(TvSerialTable tvSerial) async {
    try {
      await databaseHelperTvSerial.insertWatchlistTvSerial(tvSerial);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTvSerial(TvSerialTable tvSerial) async {
    try {
      await databaseHelperTvSerial.removeWatchlistTvSerial(tvSerial);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvSerialTable?> getTvSerialById(int id) async {
    final result = await databaseHelperTvSerial.getTvSerialById(id);
    if (result != null) {
      return TvSerialTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvSerialTable>> getWatchlistTvSerials() async {
    final result = await databaseHelperTvSerial.getWatchlistTvSerials();
    return result.map((data) => TvSerialTable.fromMap(data)).toList();
  }
}
