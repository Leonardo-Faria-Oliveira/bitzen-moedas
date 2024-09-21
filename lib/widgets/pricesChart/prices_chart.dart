import 'package:bitzen_moedas/utils/convert_timestamp.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bitzen_moedas/models/price.dart';


class PricesChart extends StatelessWidget {

  final List<Price> prices; 

  const PricesChart({super.key, required this.prices});

  String formatTimestampToDate(String timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,  
      width: 400,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          backgroundColor: Colors.blue[300],  // Define o background azul
          gridData: const FlGridData(
            horizontalInterval: 1,
            verticalInterval: 1,
            drawVerticalLine: false,
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  // Obtendo as datas dos últimos 7 dias
                      final int index = value.toInt();
                      if (index >= 0 && index < prices.length-1) {
                      final String formattedDate = formatTimestampToDate(prices[prices.length - 1 - index].timestamp);
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                        formattedDate,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        ),
                      );
                      } else {
                      return const SizedBox.shrink();
                      }
                  
                },
                interval: 1,  // Mostra um título a cada 1 ponto
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white, width: 1),
          ),
          minX: 0,
          maxX: 5,  // Correspondente aos últimos 7 dias
          minY: 0,
          maxY: 10,
          lineBarsData: [
            LineChartBarData(
                spots: prices.asMap().entries.map((entry) {
                Price price = entry.value;
                return FlSpot(entry.key.toDouble(), double.parse(double.parse(price.bid).toStringAsFixed(2)) );
                }).toList(),
              isCurved: false,  // Linha reta
              color: Colors.white,
              barWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
