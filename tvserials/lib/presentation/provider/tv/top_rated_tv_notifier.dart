import 'package:core/utils/state_enum.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_top_rated_tv.dart';
import 'package:flutter/foundation.dart';

class TopRatedTvSerialsNotifier extends ChangeNotifier {
  final GetTopRatedTvSerials getTopRatedTvSerials;

  TopRatedTvSerialsNotifier({required this.getTopRatedTvSerials});

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSerial> _tvSerials = [];
  List<TvSerial> get tvSerials => _tvSerials;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedTvSerials() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSerials.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvSerialsData) {
        _tvSerials = tvSerialsData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
