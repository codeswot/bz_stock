part of 'market_stock_bloc.dart';

abstract class MarketStockEvent extends Equatable {
  const MarketStockEvent();
}

class OnValueChanged extends MarketStockEvent {
  final DateTime fromDate;
  final DateTime toDate;

  const OnValueChanged(this.fromDate, this.toDate);

  @override
  List<Object?> get props => [fromDate, toDate];
}
