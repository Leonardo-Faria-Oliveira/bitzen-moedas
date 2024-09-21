import 'package:bitzen_moedas/models/price.dart';
import 'package:bitzen_moedas/utils/convert_timestamp.dart';
import 'package:flutter/material.dart';

class PricesDataTable extends StatelessWidget {
  final List<Price> prices;

  const PricesDataTable({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    // Cria uma cópia da lista de preços e remove o último item
    List<Price> modifiedPrices = List.from(prices)..removeAt(0);

    // Ordena a lista de preços em ordem crescente com base no timestamp
    List<Price> sortedPrices = List.from(modifiedPrices)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return Container(
      alignment: Alignment.topCenter,
      child: DataTable(
        columns: const [
          DataColumn(
            label: Text(
              'Data',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF2D6B81),
              ),
            ),
          ),
          DataColumn(
            label: Text(
              textAlign: TextAlign.left,
              softWrap: false,
              'Fechamento',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF2D6B81),
              ),
            ),
          ),
        ],
        rows: sortedPrices.map((item) {
          return DataRow(
            cells: [
              DataCell(
                Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    maxLines: 1,
                    convertTimestamp(item.timestamp),
                    style: const TextStyle(
                      color: Colors.cyan, // Cor azul como um hyperlink
                    ),
                  ),
                ),
              ),
              DataCell(
                Align(
                  alignment: Alignment.centerLeft, // Alinhamento à esquerda
                  child: Text(double.parse(item.bid).toStringAsFixed(2)),
                ),
              ),
            ],
          );
        }).toList(),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey), // Bordas cinza nas linhas
        ),
      ),
    );
  }
}
