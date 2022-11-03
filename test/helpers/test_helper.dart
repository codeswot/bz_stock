import 'package:bz_stock/data/datasources/remote_data_source.dart';
import 'package:bz_stock/domain/repositories/market_stock_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    MarketStockRepository,
    RemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
