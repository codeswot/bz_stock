import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../helpers/serialisation.dart';

part 'market_stock_pagination_model.g.dart';

@JsonSerializable(
    anyMap: true, explicitToJson: true, fieldRename: FieldRename.snake)
class MarketStockPaginationModel extends Equatable {
  const MarketStockPaginationModel({
    required this.limit,
    required this.total,
    required this.count,
    required this.offset,
  });

  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readIntValue)
  final int limit;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readIntValue)
  final int offset;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readIntValue)
  final int count;
  @JsonKey(
      includeIfNull: true,
      defaultValue: 0,
      readValue: Serialization.readIntValue)
  final int total;

  factory MarketStockPaginationModel.fromJson(Map<dynamic, dynamic> json) =>
      _$MarketStockPaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketStockPaginationModelToJson(this);

  @override
  List<Object?> get props => [limit, offset, count, total];
}
