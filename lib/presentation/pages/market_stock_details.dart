import 'package:bz_stock/data/models/market_stock_data/market_stock_data_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../widgets/market_stock_fake_chart.dart';

class MarketStockDetailPage extends StatelessWidget {
  static Route route(MarketStockDataModel marketStock) => MaterialPageRoute(
        builder: (_) => MarketStockDetailPage(marketStock),
      );
  final MarketStockDataModel data;
  const MarketStockDetailPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String fVolume = NumberFormat.compact().format(data.volume);

    return Scaffold(
        appBar: AppBar(
          title: Text('${data.symbol}/${data.exchange}'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: MarketStockFakeChart.withSampleData(),
                ),
                const SizedBox(height: 100),
                Text(
                  'Details',
                  style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: const Text('Volume'),
                  trailing: Text(fVolume),
                ),
                ListTile(
                  title: const Text('Open'),
                  trailing: Text(data.open.toString()),
                ),
                ListTile(
                  title: const Text('Close'),
                  trailing: Text(data.close.toString()),
                ),
                ListTile(
                  title: const Text('High'),
                  trailing: Text(data.high.toString()),
                ),
                ListTile(
                  title: const Text('Low'),
                  trailing: Text(data.high.toString()),
                ),
              ],
            ),
          ),
        ));
  }
}
