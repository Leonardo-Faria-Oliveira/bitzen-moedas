
import 'package:bitzen_moedas/enums/coins_combination.dart';
import 'package:bitzen_moedas/models/coin.dart';

class Price {

  final String high;
  final String low;
  final String varBid;
  final String pctChange;
  final String bid;
  final String ask;
  final String timestamp;
  final Coin coin;

  Price({
    required this.high,
    required this.low,
    required this.varBid,
    required this.pctChange,
    required this.bid,
    required this.ask,
    required this.timestamp,
    required this.coin
  });

  
  factory Price.fromJson(Map<String, dynamic> json, CoinsCombination coinsCombination){

      final coin = coinsCombination.getCode().toString().split("-");
      return Price(
          coin: Coin(
            code: coin[0],
            codein: coin[1],
            name: coin[0],
          ),
          high: json['high'],
          low: json['low'],
          varBid: json['varBid'],
          pctChange: json['pctChange'],
          bid: json['bid'],
          ask: json['ask'],
          timestamp: json['timestamp'],
      );
  }


}