import 'dart:io';

import 'package:bz_stock/data/exeptions.dart';
import 'package:bz_stock/data/failure.dart';
import 'package:bz_stock/data/repositories/market_stock_repository_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/constants.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late MarketStockRepositoryImpl marketStockRepositoryImpl;
  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    marketStockRepositoryImpl = MarketStockRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('get market stock', () {
    test(
        'should return market stock response when a call to the data source is successful',
        () async {
      when(mockRemoteDataSource.getMarketStock(fromDate, toDate)).thenAnswer(
          (realInvocation) async => tDataSourceMarketStockModelFromJson);
      //actual
      final res =
          await marketStockRepositoryImpl.getMarketStock(fromDate, toDate);
      //assert
      verify(mockRemoteDataSource.getMarketStock(fromDate, toDate));
      expect(
          res, equals(Right(tDataSourceMarketStockModelFromJson.toEntity())));
    });
    test(
      'should return server failure when call to data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getMarketStock(fromDate, toDate))
            .thenThrow(ServerException());
        //actual
        final res =
            await marketStockRepositoryImpl.getMarketStock(fromDate, toDate);
        //assert
        verify(mockRemoteDataSource.getMarketStock(fromDate, toDate));
        expect(res, equals(const Left(ServerFailure('Internal Server Error'))));
      },
    );
    test('should return connection failure when device has no internet',
        () async {
      when(mockRemoteDataSource.getMarketStock(fromDate, toDate))
          .thenThrow(const SocketException('Network Error'));

      // actual
      final result =
          await marketStockRepositoryImpl.getMarketStock(fromDate, toDate);

      // assert
      verify(mockRemoteDataSource.getMarketStock(fromDate, toDate));
      expect(
        result,
        equals(const Left(ConnectionFailure('Network Error'))),
      );
    });
  });
}
