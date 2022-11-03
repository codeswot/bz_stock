import 'package:bz_stock/domain/entities/market_stock.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../helpers/serialisation.dart';
import 'market_stock_data_model.dart';
import 'market_stock_pagination_model.dart';

part 'market_stock_response_model.g.dart';

@JsonSerializable(
    anyMap: true, explicitToJson: true, fieldRename: FieldRename.snake)
@JsonSerializable(anyMap: true, explicitToJson: true)
class MarketStockResponseModel extends Equatable {
  const MarketStockResponseModel({
    required this.pagination,
    required this.data,
  });
  @JsonKey(
      includeIfNull: true,
      defaultValue: null,
      readValue: Serialization.readMapValue)
  final MarketStockPaginationModel pagination;
  @JsonKey(
      includeIfNull: true,
      defaultValue: [],
      readValue: Serialization.readListValue)
  final List<MarketStockDataModel> data;

  factory MarketStockResponseModel.fromJson(Map<dynamic, dynamic> json) =>
      _$MarketStockResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketStockResponseModelToJson(this);

  MarketStock toEntity() => MarketStock(
        pagination: pagination,
        data: data,
      );

  @override
  List<Object?> get props => [data, pagination];
}
