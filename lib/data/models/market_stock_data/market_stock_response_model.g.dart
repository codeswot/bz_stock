// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_stock_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketStockResponseModel _$MarketStockResponseModelFromJson(Map json) =>
    MarketStockResponseModel(
      pagination: MarketStockPaginationModel.fromJson(
          Serialization.readMapValue(json, 'pagination') as Map),
      data: (Serialization.readListValue(json, 'data') as List<dynamic>?)
              ?.map((e) => MarketStockDataModel.fromJson(e as Map))
              .toList() ??
          [],
    );

Map<String, dynamic> _$MarketStockResponseModelToJson(
        MarketStockResponseModel instance) =>
    <String, dynamic>{
      'pagination': instance.pagination.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
