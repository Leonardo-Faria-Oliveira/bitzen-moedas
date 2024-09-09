
import 'package:bitzen_moedas/enums/coins_combination.dart';

class Coin {

  final String code;
  final String codein;
  final String name;

  Coin({
    required this.code,
    required this.codein,
    required this.name,
  });

  factory Coin.fromJson(Map<String, dynamic> json, CoinsCombination coinsCombination){

      String coin = coinsCombination.getCode().toString().replaceAll("-", "");
      return Coin(
          code: json[coin]['code'],
          codein: json[coin]['codein'],
          name: json[coin]['name'],
      );
  }


}