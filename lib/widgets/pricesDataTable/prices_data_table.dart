import 'package:bitzen_moedas/models/price.dart';
import 'package:bitzen_moedas/utils/convert_timestamp.dart';
import 'package:flutter/material.dart';

class PricesDataTable extends StatelessWidget {
  final List<Price> prices;

  const PricesDataTable({super.key, required this.prices});

  @override
  Widget build(BuildContext context) {
    // Cria uma cópia da lista de preços e remove o primeiro item
    List<Price> modifiedPrices = List.from(prices)..removeAt(0);

    // Ordena a lista de preços em ordem crescente com base no timestamp
    List<Price> sortedPrices = List.from(modifiedPrices)
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView( // Scroll para garantir que tabela ocupe espaço necessário
        child: PaginatedDataTable(
          primary: false,
          showEmptyRows: false,
            // Elimina margens horizontais desnecessárias
          checkboxHorizontalMargin: 20,
          horizontalMargin: 20,
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
          source: _PricesDataSource(sortedPrices),
          rowsPerPage: 6, // Número de linhas por página
          columnSpacing: 140, // Espaçamento entre colunas
          
          showCheckboxColumn: false, // Remove coluna de checkbox
        ),
         // Controlador de scroll
      ),
    );
  }
}

class _PricesDataSource extends DataTableSource {
  final List<Price> _prices;

  _PricesDataSource(this._prices);

  @override
  DataRow getRow(int index) {
    final Price item = _prices[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Container(
            width: double.infinity, // Garante que o texto ocupe todo o espaço disponível
            padding: const EdgeInsets.all(4),
            child: Text(
              maxLines: 1,
              convertTimestamp(item.timestamp),
              style: const TextStyle(
                color: Colors.cyan, // Cor azul estilo hyperlink
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
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _prices.length;

  @override
  int get selectedRowCount => 0;
}
