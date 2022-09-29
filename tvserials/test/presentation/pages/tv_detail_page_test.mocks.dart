// Mocks generated by Mockito 5.3.2 from annotations
// in tvserials/test/presentation/pages/tv_detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:ui' as _i12;

import 'package:core/utils/state_enum.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tvserials/domain/entities/tv/tv.dart' as _i10;
import 'package:tvserials/domain/entities/tv/tv_detail.dart' as _i7;
import 'package:tvserials/domain/usecases/tv/get_tv_detail.dart' as _i2;
import 'package:tvserials/domain/usecases/tv/get_tv_recommendations.dart'
    as _i3;
import 'package:tvserials/domain/usecases/tv/get_watchlist_tv_status.dart'
    as _i4;
import 'package:tvserials/domain/usecases/tv/remove_watchlist_tv.dart' as _i6;
import 'package:tvserials/domain/usecases/tv/save_watchlist_tv.dart' as _i5;
import 'package:tvserials/presentation/provider/tv/tv_detail_notifier.dart'
    as _i8;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetTvSerialDetail_0 extends _i1.SmartFake
    implements _i2.GetTvSerialDetail {
  _FakeGetTvSerialDetail_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTvSerialRecommendations_1 extends _i1.SmartFake
    implements _i3.GetTvSerialRecommendations {
  _FakeGetTvSerialRecommendations_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetWatchListTvSerialStatus_2 extends _i1.SmartFake
    implements _i4.GetWatchListTvSerialStatus {
  _FakeGetWatchListTvSerialStatus_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveWatchlistTvSerial_3 extends _i1.SmartFake
    implements _i5.SaveWatchlistTvSerial {
  _FakeSaveWatchlistTvSerial_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveWatchlistTvSerial_4 extends _i1.SmartFake
    implements _i6.RemoveWatchlistTvSerial {
  _FakeRemoveWatchlistTvSerial_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSerialDetail_5 extends _i1.SmartFake
    implements _i7.TvSerialDetail {
  _FakeTvSerialDetail_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvSerialDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSerialDetailNotifier extends _i1.Mock
    implements _i8.TvSerialDetailNotifier {
  MockTvSerialDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTvSerialDetail get getTvSerialDetail => (super.noSuchMethod(
        Invocation.getter(#getTvSerialDetail),
        returnValue: _FakeGetTvSerialDetail_0(
          this,
          Invocation.getter(#getTvSerialDetail),
        ),
      ) as _i2.GetTvSerialDetail);
  @override
  _i3.GetTvSerialRecommendations get getTvSerialRecommendations =>
      (super.noSuchMethod(
        Invocation.getter(#getTvSerialRecommendations),
        returnValue: _FakeGetTvSerialRecommendations_1(
          this,
          Invocation.getter(#getTvSerialRecommendations),
        ),
      ) as _i3.GetTvSerialRecommendations);
  @override
  _i4.GetWatchListTvSerialStatus get getWatchListTvSerialStatus =>
      (super.noSuchMethod(
        Invocation.getter(#getWatchListTvSerialStatus),
        returnValue: _FakeGetWatchListTvSerialStatus_2(
          this,
          Invocation.getter(#getWatchListTvSerialStatus),
        ),
      ) as _i4.GetWatchListTvSerialStatus);
  @override
  _i5.SaveWatchlistTvSerial get saveWatchlistTvSerial => (super.noSuchMethod(
        Invocation.getter(#saveWatchlistTvSerial),
        returnValue: _FakeSaveWatchlistTvSerial_3(
          this,
          Invocation.getter(#saveWatchlistTvSerial),
        ),
      ) as _i5.SaveWatchlistTvSerial);
  @override
  _i6.RemoveWatchlistTvSerial get removeWatchlistTvSerial =>
      (super.noSuchMethod(
        Invocation.getter(#removeWatchlistTvSerial),
        returnValue: _FakeRemoveWatchlistTvSerial_4(
          this,
          Invocation.getter(#removeWatchlistTvSerial),
        ),
      ) as _i6.RemoveWatchlistTvSerial);
  @override
  _i7.TvSerialDetail get tvSerial => (super.noSuchMethod(
        Invocation.getter(#tvSerial),
        returnValue: _FakeTvSerialDetail_5(
          this,
          Invocation.getter(#tvSerial),
        ),
      ) as _i7.TvSerialDetail);
  @override
  _i9.RequestState get tvState => (super.noSuchMethod(
        Invocation.getter(#tvState),
        returnValue: _i9.RequestState.Empty,
      ) as _i9.RequestState);
  @override
  List<_i10.TvSerial> get tvSerialRecommendations => (super.noSuchMethod(
        Invocation.getter(#tvSerialRecommendations),
        returnValue: <_i10.TvSerial>[],
      ) as List<_i10.TvSerial>);
  @override
  _i9.RequestState get recommendationState => (super.noSuchMethod(
        Invocation.getter(#recommendationState),
        returnValue: _i9.RequestState.Empty,
      ) as _i9.RequestState);
  @override
  String get message => (super.noSuchMethod(
        Invocation.getter(#message),
        returnValue: '',
      ) as String);
  @override
  bool get isAddedToWatchlist => (super.noSuchMethod(
        Invocation.getter(#isAddedToWatchlist),
        returnValue: false,
      ) as bool);
  @override
  String get watchlistMessage => (super.noSuchMethod(
        Invocation.getter(#watchlistMessage),
        returnValue: '',
      ) as String);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  _i11.Future<void> fetchTvSerialDetail(int? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchTvSerialDetail,
          [id],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  _i11.Future<void> addWatchlist(_i7.TvSerialDetail? tvSerial) =>
      (super.noSuchMethod(
        Invocation.method(
          #addWatchlist,
          [tvSerial],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  _i11.Future<void> removeFromWatchlist(_i7.TvSerialDetail? tvSerial) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromWatchlist,
          [tvSerial],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  _i11.Future<void> loadWatchlistStatus(int? id) => (super.noSuchMethod(
        Invocation.method(
          #loadWatchlistStatus,
          [id],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);
  @override
  void addListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}