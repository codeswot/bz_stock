import 'package:intl/intl.dart';

class Urls {
  static const String baseUrl = 'http://api.marketstack.com/v1';
  static const String apiKey = '470e2eaddfd778a40916932489dfa37d';
  static const defaultLimit = 10;
  static const List<String> _symbols = [
    'GOOG',
    'BABA',
    'MSFT',
    'AAPL',
    'FB',
    'VOD',
    'GE',
    'NKE',
    'GOOGL',
    'BA'
  ];

  static String getStockMarketCompanyData(DateTime fromDate, DateTime toDate) {
    final symbolList = List<String>.from(_symbols)..shuffle();
    final symbol = symbolList.join(',');
    String from = DateFormat("yyyy-MM-dd").format(fromDate);
    String to = DateFormat("yyyy-MM-dd").format(toDate);
    return '$baseUrl/eod?access_key=$apiKey&symbols=$symbol&limit=$defaultLimit&date_from$from=&date_to=$to';
  }
}
