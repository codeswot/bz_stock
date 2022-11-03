import 'package:bz_stock/domain/entities/market_stock.dart';
import 'package:bz_stock/domain/repositories/market_stock_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/failure.dart';

class GetMarketStock {
  final MarketStockRepository repository;

  GetMarketStock(this.repository);

  Future<Either<Failure, MarketStock>> execute(
      DateTime fromDate, DateTime toDate) {
    return repository.getMarketStock(fromDate, toDate);
  }
}
