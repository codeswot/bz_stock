// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_stock_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketStockDataModel _$MarketStockDataModelFromJson(Map json) =>
    MarketStockDataModel(
      adjClose: (Serialization.readDoubleValue(json, 'adj_close') as num?)
              ?.toDouble() ??
          0,
      adjHigh: (Serialization.readDoubleValue(json, 'adj_high') as num?)
              ?.toDouble() ??
          0,
      adjLow: (Serialization.readDoubleValue(json, 'adj_low') as num?)
              ?.toDouble() ??
          0,
      adjOpen: (Serialization.readDoubleValue(json, 'adj_open') as num?)
              ?.toDouble() ??
          0,
      adjVolume: (Serialization.readDoubleValue(json, 'adj_volume') as num?)
              ?.toDouble() ??
          0,
      close:
          (Serialization.readDoubleValue(json, 'close') as num?)?.toDouble() ??
              0,
      date: Serialization.readStringValue(json, 'date') as String? ?? '',
      dividend: (Serialization.readDoubleValue(json, 'dividend') as num?)
              ?.toDouble() ??
          0,
      exchange:
          Serialization.readStringValue(json, 'exchange') as String? ?? '',
      high: (Serialization.readDoubleValue(json, 'high') as num?)?.toDouble() ??
          0,
      low:
          (Serialization.readDoubleValue(json, 'low') as num?)?.toDouble() ?? 0,
      open: (Serialization.readDoubleValue(json, 'open') as num?)?.toDouble() ??
          0,
      splitFactor: (Serialization.readDoubleValue(json, 'split_factor') as num?)
              ?.toDouble() ??
          0,
      symbol: Serialization.readStringValue(json, 'symbol') as String? ?? '',
      volume:
          (Serialization.readDoubleValue(json, 'volume') as num?)?.toDouble() ??
              0,
    );

Map<String, dynamic> _$MarketStockDataModelToJson(
        MarketStockDataModel instance) =>
    <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
      'adj_high': instance.adjHigh,
      'adj_low': instance.adjLow,
      'adj_close': instance.adjClose,
      'adj_open': instance.adjOpen,
      'adj_volume': instance.adjVolume,
      'split_factor': instance.splitFactor,
      'dividend': instance.dividend,
      'symbol': instance.symbol,
      'exchange': instance.exchange,
      'date': instance.date,
    };
