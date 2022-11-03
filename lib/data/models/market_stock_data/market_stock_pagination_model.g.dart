// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_stock_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketStockPaginationModel _$MarketStockPaginationModelFromJson(Map json) =>
    MarketStockPaginationModel(
      limit: Serialization.readIntValue(json, 'limit') as int? ?? 0,
      total: Serialization.readIntValue(json, 'total') as int? ?? 0,
      count: Serialization.readIntValue(json, 'count') as int? ?? 0,
      offset: Serialization.readIntValue(json, 'offset') as int? ?? 0,
    );

Map<String, dynamic> _$MarketStockPaginationModelToJson(
        MarketStockPaginationModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'count': instance.count,
      'total': instance.total,
    };
