import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../helpers/serialisation.dart';

part 'market_stock_data_model.g.dart';

@JsonSerializable(
    anyMap: true, explicitToJson: true, fieldRename: FieldRename.snake)
class MarketStockDataModel extends Equatable {
  const MarketStockDataModel({
    required this.adjClose,
    required this.adjHigh,
    required this.adjLow,
    required this.adjOpen,
    required this.adjVolume,
    required this.close,
    required this.date,
    required this.dividend,
    required this.exchange,
    required this.high,
    required this.low,
    required this.open,
    required this.splitFactor,
    required this.symbol,
    required this.volume,
  });
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double open;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double high;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double low;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double close;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double volume;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double adjHigh;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double adjLow;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double adjClose;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double adjOpen;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double adjVolume;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double splitFactor;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readDoubleValue)
  final double dividend;
  @JsonKey(
      includeIfNull: true,
      defaultValue: '',
      readValue: Serialization.readStringValue)
  final String symbol;
  @JsonKey(
      includeIfNull: true,
      defaultValue: '',
      readValue: Serialization.readStringValue)
  final String exchange;
  @JsonKey(
      includeIfNull: true,
      defaultValue: '',
      readValue: Serialization.readStringValue)
  final String date;

  factory MarketStockDataModel.fromJson(Map<dynamic, dynamic> json) =>
      _$MarketStockDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketStockDataModelToJson(this);

  @override
  List<Object?> get props => [
        open,
        high,
        low,
        close,
        volume,
        adjHigh,
        adjLow,
        adjClose,
        adjOpen,
        adjVolume,
        splitFactor,
        dividend,
        symbol,
        exchange,
        date,
      ];
}
