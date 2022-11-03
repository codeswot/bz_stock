import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MarketStockLoadingWidget extends StatelessWidget {
  const MarketStockLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('market_stock_loading'),
      child: SpinKitFadingCube(
        color: Colors.blue,
        size: 100,
      ),
    );
  }
}
