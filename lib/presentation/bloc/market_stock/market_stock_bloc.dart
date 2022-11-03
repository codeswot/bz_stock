import 'package:bz_stock/domain/entities/market_stock.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecases/get_market_stock.dart';

part 'market_stock_event.dart';
part 'market_stock_state.dart';

class MarketStockBloc extends Bloc<MarketStockEvent, MarketStockState> {
  final GetMarketStock _getMarketStock;
  MarketStockBloc(this._getMarketStock) : super(MarketStockEmpty()) {
    on<OnValueChanged>(_onDatesChanged);
    // transformer:
    debounce(const Duration(milliseconds: 500));
  }
  void _onDatesChanged(
      OnValueChanged events, Emitter<MarketStockState> emit) async {
    emit(MarketStockLoading());

    final res = await _getMarketStock.execute(events.fromDate, events.toDate);
    res.fold(
      (failL) {
        emit(MarketStockError(failL.message));
      },
      (dataR) {
        emit(MarketStockHasData(dataR));
      },
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) =>
      (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
