import 'package:bz_stock/presentation/bloc/market_stock/market_stock_bloc.dart';
import 'package:bz_stock/presentation/buildexthelper.dart';
import 'package:bz_stock/presentation/pages/search_market_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../data/models/market_stock_data/market_stock_data_model.dart';
import 'market_stock_list_tile.dart';

class MarketStockDataWidget extends StatefulWidget {
  const MarketStockDataWidget(this.marketStocks, {Key? key}) : super(key: key);
  final List<MarketStockDataModel> marketStocks;

  @override
  State<MarketStockDataWidget> createState() => _MarketStockDataWidgetState();
}

class _MarketStockDataWidgetState extends State<MarketStockDataWidget> {
  DateTime fromDate = DateTime.now().subtract(const Duration(days: 1));
  DateTime toDate = DateTime.now();
  void _pickFromDate() async {
    fromDate = await showDatePicker(
            context: context,
            initialDate: fromDate,
            firstDate: DateTime(2019, 04, 04),
            lastDate: toDate) ??
        fromDate;

    setState(() {});
  }

  void _pickToDate() async {
    toDate = (await showDatePicker(
            context: context,
            initialDate: toDate,
            firstDate: DateTime(2019, 04, 04),
            lastDate: toDate)) ??
        toDate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('market_stock_data'),
      appBar: AppBar(
        title: const Text('MarketStack'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async => _pickFromDate(),
                  child: Row(
                    children: [
                      Text(
                        'From: ${DateFormat("yyyy-MM-dd").format(fromDate)}',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.date_range,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async => _pickToDate(),
                  child: Row(
                    children: [
                      Text(
                        'To: ${DateFormat("yyyy-MM-dd").format(toDate)}',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.date_range,
                        size: 20,
                      )
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.white.withOpacity(0.3)),
                  onPressed: () {
                    context
                        .read<MarketStockBloc>()
                        .add(OnValueChanged(fromDate, toDate));
                  },
                  child: const Text('GET'),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              tooltip: 'Search Stock',
              onPressed: () {
                context.push(SearchMarketStock.route(widget.marketStocks));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: widget.marketStocks.length,
            itemBuilder: (context, index) {
              final data = widget.marketStocks[index];

              return MarketStockListTile(data);
            }),
      ),
    );
  }
}
