import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_now_playing_tv.dart';
import 'package:core/utils/state_enum.dart';
import 'package:tvserials/domain/usecases/tv/get_popular_tv.dart';
import 'package:tvserials/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:flutter/material.dart';

class TvSerialListNotifier extends ChangeNotifier {
  var _nowPlayingTvSerials = <TvSerial>[];
  List<TvSerial> get nowPlayingTvSerials => _nowPlayingTvSerials;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  var _popularTvSerials = <TvSerial>[];
  List<TvSerial> get popularTvSerials => _popularTvSerials;

  RequestState _popularTvSerialsState = RequestState.Empty;
  RequestState get popularTvSerialsState => _popularTvSerialsState;

  var _topRatedTvSerials = <TvSerial>[];
  List<TvSerial> get topRatedTvSerials => _topRatedTvSerials;

  RequestState _topRatedTvSerialsState = RequestState.Empty;
  RequestState get topRatedTvSerialsState => _topRatedTvSerialsState;

  String _message = '';
  String get message => _message;

  TvSerialListNotifier({
    required this.getNowPlayingTvSerials,
    required this.getPopularTvSerials,
    required this.getTopRatedTvSerials,
  });

  final GetNowPlayingTvSerials getNowPlayingTvSerials;
  final GetPopularTvSerials getPopularTvSerials;
  final GetTopRatedTvSerials getTopRatedTvSerials;

  Future<void> fetchNowPlayingTvSerials() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();

    final result = await getNowPlayingTvSerials.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSerialsData) {
        _nowPlayingState = RequestState.Loaded;
        _nowPlayingTvSerials = tvSerialsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTvSerials() async {
    _popularTvSerialsState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvSerials.execute();
    result.fold(
      (failure) {
        _popularTvSerialsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSerialsData) {
        _popularTvSerialsState = RequestState.Loaded;
        _popularTvSerials = tvSerialsData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTvSerials() async {
    _topRatedTvSerialsState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSerials.execute();
    result.fold(
      (failure) {
        _topRatedTvSerialsState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSerialsData) {
        _topRatedTvSerialsState = RequestState.Loaded;
        _topRatedTvSerials = tvSerialsData;
        notifyListeners();
      },
    );
  }
}
