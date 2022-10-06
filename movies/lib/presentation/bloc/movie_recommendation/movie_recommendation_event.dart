part of 'movie_recommendation_bloc.dart';

abstract class MovieRecommendationEvent extends Equatable {
  const MovieRecommendationEvent();

  @override
  List<Object> get props => [];
}

class OnRecommendationCalled extends MovieRecommendationEvent {
  final int id;

  const OnRecommendationCalled(this.id);

  @override
  List<Object> get props => [id];
}
