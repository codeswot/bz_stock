import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:bz_stock/data/constant.dart';
import 'package:bz_stock/presentation/bloc/market_stock/market_stock_bloc.dart';
import 'package:bz_stock/presentation/widgets/market_stock_data.dart';
import 'package:bz_stock/presentation/widgets/market_stock_error.dart';
import 'package:bz_stock/presentation/widgets/market_stock_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/constants.dart';

class MockMarketStockBloc extends MockBloc<MarketStockEvent, MarketStockState>
    implements MarketStockBloc {}

class FakeMarketStockEvent extends Fake implements MarketStockEvent {}

class FakeMarketStockState extends Fake implements MarketStockState {}

void main() {
  late MockMarketStockBloc mockMarketStockBloc;

  setUpAll(() async {
    HttpOverrides.global = null;
    registerFallbackValue(FakeMarketStockEvent());
    registerFallbackValue(FakeMarketStockState());

    //dependency injection
    final di = GetIt.instance;
    di.registerFactory(() => mockMarketStockBloc);
  });

  setUp(() {
    mockMarketStockBloc = MockMarketStockBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MarketStockBloc>.value(
      value: mockMarketStockBloc,
      child: MaterialApp(
        home: Scaffold(
          body: body,
        ),
      ),
    );
  }

  testWidgets(
    'should show progress indicator when state is loading',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarketStockBloc.state).thenReturn(MarketStockLoading());

      // actual
      await tester
          .pumpWidget(makeTestableWidget(const MarketStockLoadingWidget()));

      // assert
      expect(find.byKey(const Key('market_stock_loading')),
          equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show widget contain market stock data when state is has data',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarketStockBloc.state).thenReturn(
          MarketStockHasData(tDataSourceMarketStockModelFromJson.toEntity()));

      // act
      await tester.pumpWidget(makeTestableWidget(
          MarketStockDataWidget(tDataSourceMarketStockModelFromJson.data)));
      await tester.runAsync(() async {
        final HttpClient client = HttpClient();
        await client.getUrl(
            Uri.parse(Urls.getStockMarketCompanyData(fromDate, toDate)));
      });
      await tester.pumpAndSettle();

      // assert
      expect(
          find.byKey(const Key('market_stock_data')), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show Error Page when state is Error',
    (WidgetTester tester) async {
      // arrange
      when(() => mockMarketStockBloc.state)
          .thenReturn(const MarketStockError(''));

      // actual
      await tester
          .pumpWidget(makeTestableWidget(const MarketStockErrorWidget('')));

      // assert
      expect(
          find.byKey(const Key('market_stock_error')), equals(findsOneWidget));
    },
  );
}
