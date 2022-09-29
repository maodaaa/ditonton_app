import 'package:core/utils/state_enum.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/domain/usecases/tv/get_popular_tv.dart';
import 'package:flutter/foundation.dart';

class PopularTvSerialsNotifier extends ChangeNotifier {
  final GetPopularTvSerials getPopularTvSerials;

  PopularTvSerialsNotifier(this.getPopularTvSerials);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TvSerial> _tvSerials = [];
  List<TvSerial> get tvSerials => _tvSerials;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTvSerials() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvSerials.execute();

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
