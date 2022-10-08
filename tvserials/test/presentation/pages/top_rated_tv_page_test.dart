import 'package:core/utils/state_enum.dart';
import 'package:tvserials/domain/entities/tv/tv.dart';
import 'package:tvserials/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'package:tvserials/presentation/pages/tv/top_rated_tv_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'top_rated_tv_page_test.mocks.dart';

@GenerateMocks([TopRatedTvBloc])
void main() {
  // late MockTopRatedTvSerialsNotifier mockNotifier;

  // setUp(() {
  //   mockNotifier = MockTopRatedTvSerialsNotifier();
  // });

  // Widget _makeTestableWidget(Widget body) {
  //   return ChangeNotifierProvider<TopRatedTvSerialsNotifier>.value(
  //     value: mockNotifier,
  //     child: MaterialApp(
  //       home: body,
  //     ),
  //   );
  // }

  // testWidgets('Page should display progress bar when loading',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.state).thenReturn(RequestState.Loading);

  //   final progressFinder = find.byType(CircularProgressIndicator);
  //   final centerFinder = find.byType(Center);

  //   await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

  //   expect(centerFinder, findsOneWidget);
  //   expect(progressFinder, findsOneWidget);
  // });

  // testWidgets('Page should display when data is loaded',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.state).thenReturn(RequestState.Loaded);
  //   when(mockNotifier.tvSerials).thenReturn(<TvSerial>[]);

  //   final listViewFinder = find.byType(ListView);

  //   await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

  //   expect(listViewFinder, findsOneWidget);
  // });

  // testWidgets('Page should display text with message when Error',
  //     (WidgetTester tester) async {
  //   when(mockNotifier.state).thenReturn(RequestState.Error);
  //   when(mockNotifier.message).thenReturn('Error message');

  //   final textFinder = find.byKey(Key('error_message'));

  //   await tester.pumpWidget(_makeTestableWidget(TopRatedTvPage()));

  //   expect(textFinder, findsOneWidget);
  // });
}
