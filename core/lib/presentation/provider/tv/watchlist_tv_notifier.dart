import 'package:core/utils/state_enum.dart';
import 'package:core/domain/entities/tv/tv.dart';
import 'package:core/domain/usecases/tv/get_watchlist_tv.dart';
import 'package:flutter/foundation.dart';

class WatchlistTvNotifier extends ChangeNotifier {
  var _watchlistTvSerials = <TvSerial>[];
  List<TvSerial> get watchlistTvSerials => _watchlistTvSerials;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTvNotifier({required this.getWatchlistTvSerial});

  final GetWatchlistTvSerial getWatchlistTvSerial;

  Future<void> fetchWatchlistTvSerial() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvSerial.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSerialsData) {
        _watchlistState = RequestState.Loaded;
        _watchlistTvSerials = tvSerialsData;
        notifyListeners();
      },
    );
  }
}
