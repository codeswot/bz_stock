import 'package:bloc_test/bloc_test.dart';
import 'package:bz_stock/data/failure.dart';
import 'package:bz_stock/domain/usecases/get_market_stock.dart';
import 'package:bz_stock/presentation/bloc/market_stock/market_stock_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/constants.dart';
import 'market_stock_bloc_test.mocks.dart';

@GenerateMocks([GetMarketStock])
void main() {
  late MockGetMarketStock mockGetMarketStock;
  late MarketStockBloc marketStockBloc;

  setUp(() {
    mockGetMarketStock = MockGetMarketStock();
    marketStockBloc = MarketStockBloc(mockGetMarketStock);
  });

  test('Initial state should be empty market stock', () {
    expect(marketStockBloc.state, MarketStockEmpty());
  });

  blocTest<MarketStockBloc, MarketStockState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetMarketStock.execute(fromDate, toDate)).thenAnswer(
          (_) async => Right(tDataSourceMarketStockModelFromJson.toEntity()));
      return marketStockBloc;
    },
    act: (bloc) => bloc.add(OnValueChanged(fromDate, toDate)),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      MarketStockLoading(),
      MarketStockHasData(tDataSourceMarketStockModelFromJson.toEntity()),
    ],
    verify: (bloc) {
      verify(mockGetMarketStock.execute(fromDate, toDate));
    },
  );
  blocTest<MarketStockBloc, MarketStockState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(mockGetMarketStock.execute(fromDate, toDate))
          .thenAnswer((_) async => const Left(ServerFailure('Server failure')));
      return marketStockBloc;
    },
    act: (bloc) => bloc.add(OnValueChanged(fromDate, toDate)),
    expect: () => [
      MarketStockLoading(),
      const MarketStockError('Server failure'),
    ],
    verify: (bloc) {
      verify(mockGetMarketStock.execute(fromDate, toDate));
    },
  );
}
