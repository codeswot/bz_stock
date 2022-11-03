import 'package:bz_stock/domain/usecases/get_market_stock.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/constants.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockMarketStockRepository mockMarketStockRepository;
  late GetMarketStock useCases;

  setUp(() {
    mockMarketStockRepository = MockMarketStockRepository();
    useCases = GetMarketStock(mockMarketStockRepository);
  });

  test(
    'should get Market Stock data from the repository',
    () async {
      // arrange
      when(mockMarketStockRepository.getMarketStock(fromDate, toDate))
          .thenAnswer((_) async =>
              Right(tDataSourceMarketStockModelFromJson.toEntity()));

      // act
      final result = await useCases.execute(fromDate, toDate);

      // assert
      expect(result,
          equals(Right(tDataSourceMarketStockModelFromJson.toEntity())));
    },
  );
}
