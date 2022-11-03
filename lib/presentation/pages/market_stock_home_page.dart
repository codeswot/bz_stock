import 'package:bz_stock/presentation/widgets/market_stock_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/market_stock/market_stock_bloc.dart';
import '../widgets/market_stock_data.dart';
import '../widgets/market_stock_error.dart';

class MarketStockHomePage extends StatelessWidget {
  const MarketStockHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MarketStockBloc, MarketStockState>(
        builder: (context, state) {
          if (state is MarketStockLoading) {
            return const MarketStockLoadingWidget();
          }
          if (state is MarketStockError) {
            return MarketStockErrorWidget(state.message);
          }
          if (state is MarketStockHasData) {
            return MarketStockDataWidget(state.result.data);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
