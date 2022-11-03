import 'package:bz_stock/presentation/buildexthelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/market_stock_data/market_stock_data_model.dart';
import '../widgets/market_stock_list_tile.dart';

class SearchMarketStock extends StatefulWidget {
  static Route route(List<MarketStockDataModel> marketStocks) =>
      MaterialPageRoute(
        builder: (_) => SearchMarketStock(marketStocks),
      );
  const SearchMarketStock(this.marketStocks, {Key? key}) : super(key: key);
  final List<MarketStockDataModel> marketStocks;

  @override
  State<SearchMarketStock> createState() => _SearchMarketStockState();
}

class _SearchMarketStockState extends State<SearchMarketStock> {
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TypeAheadField<MarketStockDataModel>(
            suggestionsCallback: (String pattern) {
              List<MarketStockDataModel> matches = [];
              matches.addAll(widget.marketStocks);
              matches.retainWhere((s) =>
                  s.symbol.toLowerCase().contains(pattern.toLowerCase()));
              return matches;
            },
            itemBuilder: (BuildContext context, data) {
              return MarketStockListTile(data);
            },
            onSuggestionSelected: (Object? suggestion) {},
            textFieldConfiguration: TextFieldConfiguration(
              controller: _typeAheadController,
              decoration: InputDecoration(
                  hintText: 'Search Market Stock',
                  hintStyle: GoogleFonts.nunito(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                  )),
                  prefixIcon: GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(Icons.close),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () => _typeAheadController.clear(),
                    child: const Icon(Icons.backspace),
                  )),
              autofocus: true,
            ),
          ),
        ),
      ),
    );
  }
}
