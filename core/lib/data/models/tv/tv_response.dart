import 'package:core/data/models/tv/tv_model.dart';
import 'package:equatable/equatable.dart';

class TvSerialResponse extends Equatable {
  final List<TvSerialModel> tvSerialList;
  const TvSerialResponse({
    required this.tvSerialList,
  });

  factory TvSerialResponse.fromJson(Map<String, dynamic> json) =>
      TvSerialResponse(
        tvSerialList: List<TvSerialModel>.from((json["results"] as List)
            .map((x) => TvSerialModel.fromJson(x))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvSerialList.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [tvSerialList];
}
