import 'dart:convert';

import 'package:bz_stock/data/models/market_stock_data/market_stock_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/constants.dart';
import '../../helpers/json_reader.dart';

void main() {
  group('to entity', () {
    test(
      'should be a subclass of MarketStock entity',
      () async {
        // assert
        final result = tDataSourceMarketStockModelFromJson.toEntity();
        expect(result, equals(tDataSourceMarketStockModelFromJson.toEntity()));
      },
    );
  });
  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
          readJson('helpers/dummy_data/dummy_market_stock_response.json'),
        );

        // actual
        final result = MarketStockResponseModel.fromJson(jsonMap);

        // assert
        expect(result, equals(tDataSourceMarketStockModelFromJson));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        // act
        final result = tDataSourceMarketStockModelFromJson.toJson();

        // assert
        final expectedJsonMap = {
          "pagination": {
            "limit": 10,
            "total": 10,
            "count": 10,
            "offset": 0,
          },
          "data": result['data']
        };
        expect(result, equals(expectedJsonMap));
      },
    );
  });
}
