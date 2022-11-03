import 'package:bz_stock/presentation/bloc/market_stock/market_stock_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class MarketStockErrorWidget extends StatelessWidget {
  const MarketStockErrorWidget(this.message, {Key? key}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('market_stock_error'),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Oops!',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 16),
          Lottie.asset(
            message == 'Network Error'
                ? 'assets/lottie/internet_error.json'
                : 'assets/lottie/server_error.json',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message == 'Network Error'
                  ? 'You don\'t seem to have an active internet connection. please check your connection and reload to try again'
                  : 'The Server encountered an error and could not complete your request, please reload to try again. \n if the problem persist contact us ',
              style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
                onPressed: () =>
                    context.read<MarketStockBloc>().add(OnValueChanged(
                          DateTime.now().subtract(const Duration(days: 1)),
                          DateTime.now(),
                        )),
                child: const Text('Reload')),
          ),
        ],
      ),
    );
  }
}
