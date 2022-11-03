import 'package:equatable/equatable.dart';

import '../../data/models/market_stock_data/market_stock_data_model.dart';
import '../../data/models/market_stock_data/market_stock_pagination_model.dart';

class MarketStock extends Equatable {
  const MarketStock({required this.pagination, required this.data});
  final MarketStockPaginationModel pagination;
  final List<MarketStockDataModel> data;

  @override
  List<Object?> get props => [data, pagination];
}
