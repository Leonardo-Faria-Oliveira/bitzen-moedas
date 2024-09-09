import 'package:bitzen_moedas/enums/coins_combination.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/coin.dart';


CoinsCombination getCoinCombination(String coinLabel){

  return CoinsCombination.values.firstWhere((combination) => combination.getLabel() == coinLabel);

}

Future<Coin> getCoin(String coin, String refCoin) async {

  final CoinsCombination coinsCombination = getCoinCombination("$coin-$refCoin");

  final response = await http
      .get(Uri.parse('https://economia.awesomeapi.com.br/json/last/${coinsCombination.getCode()}'));
  
  if (response.statusCode == 200) {
    return Coin.fromJson(jsonDecode(response.body) as Map<String, dynamic>, coinsCombination);
  } else {
    return Future.error("Ops! Um erro ocorreu.");
  }

}
