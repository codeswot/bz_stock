import 'package:bz_stock/presentation/buildexthelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../data/models/market_stock_data/market_stock_data_model.dart';
import '../pages/market_stock_details.dart';

class MarketStockListTile extends StatelessWidget {
  const MarketStockListTile(this.data, {Key? key}) : super(key: key);
  final MarketStockDataModel data;
  @override
  Widget build(BuildContext context) {
    final String fVolume = NumberFormat.compact().format(data.volume);

    return ListTile(
      key: const Key('market_stock_data_tile'),
      onTap: () => context.push(MarketStockDetailPage.route(data)),
      title: Text(data.symbol),
      trailing: SizedBox(
        width: 280,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'High',
                  style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                Text(
                  data.high.toString(),
                  style: GoogleFonts.nunito(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Low',
                  style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                Text(
                  data.low.toString(),
                  style: GoogleFonts.nunito(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Volume',
                  style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                Text(
                  fVolume,
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
