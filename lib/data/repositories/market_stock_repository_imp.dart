import 'dart:io';

import 'package:bz_stock/data/failure.dart';
import 'package:bz_stock/domain/entities/market_stock.dart';
import 'package:bz_stock/domain/repositories/market_stock_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/remote_data_source.dart';
import '../exeptions.dart';

class MarketStockRepositoryImpl implements MarketStockRepository {
  final RemoteDataSource remoteDataSource;

  MarketStockRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, MarketStock>> getMarketStock(
      DateTime fromDate, DateTime toDate) async {
    try {
      final result = await remoteDataSource.getMarketStock(fromDate, toDate);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Internal Server Error'));
    } on SocketException {
      return const Left(ConnectionFailure('Network Error'));
    }
  }
}
