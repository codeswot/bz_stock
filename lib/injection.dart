import 'package:bz_stock/data/repositories/market_stock_repository_imp.dart';
import 'package:bz_stock/domain/repositories/market_stock_repository.dart';
import 'package:bz_stock/domain/usecases/get_market_stock.dart';
import 'package:bz_stock/presentation/bloc/market_stock/market_stock_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'data/datasources/remote_data_source.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => MarketStockBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetMarketStock(locator()));

  // repository
  locator.registerLazySingleton<MarketStockRepository>(
    () => MarketStockRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
