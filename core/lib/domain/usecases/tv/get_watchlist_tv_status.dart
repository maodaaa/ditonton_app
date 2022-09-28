import 'package:core/domain/repositories/tv_repository.dart';

class GetWatchListTvSerialStatus {
  final TvSerialRepository repository;

  GetWatchListTvSerialStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlistTvSerial(id);
  }
}
