import 'dart:convert';

import 'package:bz_stock/data/constant.dart';
import 'package:http/http.dart' as http;

import '../exeptions.dart';
import '../models/market_stock_data/market_stock_response_model.dart';

abstract class RemoteDataSource {
  Future<MarketStockResponseModel> getMarketStock(
      DateTime fromDate, DateTime toDate);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<MarketStockResponseModel> getMarketStock(
      DateTime fromDate, DateTime toDate) async {
    final response = await client
        .get(Uri.parse(Urls.getStockMarketCompanyData(fromDate, toDate)));

    if (response.statusCode == 200) {
      return MarketStockResponseModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
