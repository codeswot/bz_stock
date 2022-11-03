import 'package:bz_stock/data/failure.dart';
import 'package:bz_stock/domain/entities/market_stock.dart';
import 'package:dartz/dartz.dart';

abstract class MarketStockRepository {
  Future<Either<Failure, MarketStock>> getMarketStock(
      DateTime fromDate, DateTime toDate);
}
