part of 'market_stock_bloc.dart';

abstract class MarketStockState extends Equatable {
  const MarketStockState();

  @override
  List<Object?> get props => [];
}

class MarketStockEmpty extends MarketStockState {}

class MarketStockLoading extends MarketStockState {}

class MarketStockError extends MarketStockState {
  final String message;

  const MarketStockError(this.message);

  @override
  List<Object?> get props => [message];
}

class MarketStockHasData extends MarketStockState {
  final MarketStock result;

  const MarketStockHasData(this.result);

  @override
  List<Object?> get props => [result];
}
