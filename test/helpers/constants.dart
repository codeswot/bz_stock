import 'dart:convert';

import 'package:bz_stock/data/models/market_stock_data/market_stock_response_model.dart';

import 'json_reader.dart';

//dummy response data

final tDataSourceMarketStockModelFromJson = MarketStockResponseModel.fromJson(
  json.decode(
    readJson('helpers/dummy_data/dummy_market_stock_response.json'),
  ),
);

final fromDate = DateTime(2021, 8, 19);
final toDate = DateTime.now();
const symbol = 'AAPL';
