// import 'package:core/utils/state_enum.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies/domain/entities/movie/movie.dart';
// import 'package:movies/presentation/bloc/movie_detail/movie_detail_bloc.dart';
// import 'package:movies/presentation/pages/movie/movie_detail_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import '../../dummy_data/dummy_objects_movie.dart';
// import 'movie_detail_page_test.mocks.dart';

// @GenerateMocks([MovieDetailBloc])
// void main() {
//   late MockMovieDetailBloc mockMovieDetailBloc;

//   setUp(() {
//     mockMovieDetailBloc = MockMovieDetailBloc();
//   });

//   Widget _makeTestableWidget(Widget body) {
//     return BlocProvider.of<MovieDetailBloc>().value(
//       value: mockMovieDetailBloc,
//       child: MaterialApp(
//         home: body,
//       ),
//     );
//   }

//   testWidgets(
//       'Watchlist button should display add icon when movie not added to watchlist',
//       (WidgetTester tester) async {
//     when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movie).thenReturn(testMovieDetail);
//     when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
//     when(mockNotifier.isAddedToWatchlist).thenReturn(false);

//     final watchlistButtonIcon = find.byIcon(Icons.add);

//     await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

//     expect(watchlistButtonIcon, findsOneWidget);
//   });

//   testWidgets(
//       'Watchlist button should dispay check icon when movie is added to wathclist',
//       (WidgetTester tester) async {
//     when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movie).thenReturn(testMovieDetail);
//     when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
//     when(mockNotifier.isAddedToWatchlist).thenReturn(true);

//     final watchlistButtonIcon = find.byIcon(Icons.check);

//     await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

//     expect(watchlistButtonIcon, findsOneWidget);
//   });

//   testWidgets(
//       'Watchlist button should display Snackbar when added to watchlist',
//       (WidgetTester tester) async {
//     when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movie).thenReturn(testMovieDetail);
//     when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
//     when(mockNotifier.isAddedToWatchlist).thenReturn(false);
//     when(mockNotifier.watchlistMessage).thenReturn('Added to Watchlist');

//     final watchlistButton = find.byType(ElevatedButton);

//     await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

//     expect(find.byIcon(Icons.add), findsOneWidget);

//     await tester.tap(watchlistButton);
//     await tester.pump();

//     expect(find.byType(SnackBar), findsOneWidget);
//     expect(find.text('Added to Watchlist'), findsOneWidget);
//   });

//   testWidgets(
//       'Watchlist button should display AlertDialog when add to watchlist failed',
//       (WidgetTester tester) async {
//     when(mockNotifier.movieState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movie).thenReturn(testMovieDetail);
//     when(mockNotifier.recommendationState).thenReturn(RequestState.Loaded);
//     when(mockNotifier.movieRecommendations).thenReturn(<Movie>[]);
//     when(mockNotifier.isAddedToWatchlist).thenReturn(false);
//     when(mockNotifier.watchlistMessage).thenReturn('Failed');

//     final watchlistButton = find.byType(ElevatedButton);

//     await tester.pumpWidget(_makeTestableWidget(MovieDetailPage(id: 1)));

//     expect(find.byIcon(Icons.add), findsOneWidget);

//     await tester.tap(watchlistButton);
//     await tester.pump();

//     expect(find.byType(AlertDialog), findsOneWidget);
//     expect(find.text('Failed'), findsOneWidget);
//   });
// }
