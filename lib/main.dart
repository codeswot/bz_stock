import 'package:bz_stock/presentation/bloc/market_stock/market_stock_bloc.dart';
import 'package:bz_stock/presentation/pages/market_stock_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MarketStockBloc>()
            ..add(
              OnValueChanged(
                DateTime.now().subtract(const Duration(days: 1)),
                DateTime.now(),
              ),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'BZ Stock',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MarketStockHomePage(),
      ),
    );
  }
}
