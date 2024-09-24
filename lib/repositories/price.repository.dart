import 'package:bitzen_moedas/enums/coins_combination.dart';
import 'package:bitzen_moedas/models/price.dart';
import 'package:bitzen_moedas/repositories/coin.repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Price>> getPricesByPeriod(String coin, String refCoin, String period) async {

  final CoinsCombination coinsCombination = getCoinCombination("$coin-$refCoin");

  final response = await http
      .get(Uri.parse('https://economia.awesomeapi.com.br/json/daily/${coinsCombination.getCode()}/$period'));
  
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return List<Price>.from(json.map((price) {
      return Price.fromJson(price, coinsCombination);
    }));

  } else {
    return Future.error("Ops! Um erro ocorreu.");
  }
  
}