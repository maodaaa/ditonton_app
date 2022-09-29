import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/entities/tv/tv_detail.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart';
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart';
import 'package:core/utils/state_enum.dart';
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart';
import 'package:tvserials/domain/usecases/tv/remove_watchlist_tv.dart';
import 'package:tvserials/domain/usecases/tv/save_watchlist_tv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TvSerialDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetTvSerialDetail getTvSerialDetail;
  final GetTvSerialRecommendations getTvSerialRecommendations;
  final GetWatchListTvSerialStatus getWatchListTvSerialStatus;
  final SaveWatchlistTvSerial saveWatchlistTvSerial;
  final RemoveWatchlistTvSerial removeWatchlistTvSerial;

  TvSerialDetailNotifier({
    required this.getTvSerialDetail,
    required this.getTvSerialRecommendations,
    required this.getWatchListTvSerialStatus,
    required this.saveWatchlistTvSerial,
    required this.removeWatchlistTvSerial,
  });

  late TvSerialDetail _tvSerial;
  TvSerialDetail get tvSerial => _tvSerial;

  RequestState _tvState = RequestState.Empty;
  RequestState get tvState => _tvState;

  List<TvSerial> _tvSerialRecommendations = [];
  List<TvSerial> get tvSerialRecommendations => _tvSerialRecommendations;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  Future<void> fetchTvSerialDetail(int id) async {
    _tvState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvSerialDetail.execute(id);
    final recommendationResult = await getTvSerialRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _tvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSerial) {
        _recommendationState = RequestState.Loading;
        _tvSerial = tvSerial;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (tvSerials) {
            _recommendationState = RequestState.Loaded;
            _tvSerialRecommendations = tvSerials;
          },
        );
        _tvState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlist(TvSerialDetail tvSerial) async {
    final result = await saveWatchlistTvSerial.execute(tvSerial);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvSerial.id);
  }

  Future<void> removeFromWatchlist(TvSerialDetail tvSerial) async {
    final result = await removeWatchlistTvSerial.execute(tvSerial);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(tvSerial.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getWatchListTvSerialStatus.execute(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
