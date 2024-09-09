import 'package:bitzen_moedas/models/price.dart';
import 'package:bitzen_moedas/repositories/price.repository.dart';
import 'package:bitzen_moedas/utils/convert_timestamp.dart';
import 'package:flutter/material.dart';
import 'package:bitzen_moedas/enums/dashboard_type.dart';
import 'package:bitzen_moedas/widgets/appNavbar/app_navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  DashboardType boardType = DashboardType.byLastSevenDays;
  late Future<List<Price>> prices;

  int logNumber = 1;

  void setBoard(DashboardType type) {
    boardType = type;
  }

  @override
  void initState() {
    super.initState();
    prices = getPricesByLastSevenDays("dolar", "real");
  }

  void setLogNumber(int number) {
    logNumber = number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavbar(),
      body: FutureBuilder(
        future: prices,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
              child: Column(
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40), // Espaço horizontal de 20 pixels
                  DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF2D6B81)
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Fechamento',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF2D6B81)
                          ),
                        ),
                      ),
                    ],
                    rows: snapshot.data!.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              padding: EdgeInsets.all(2),
                              child: Text(
                              convertTimestamp(item.timestamp),
                              style: const TextStyle(
                                color: Colors.cyan, // Cor azul como um hyperlink
                              ),
                            ),
                            )
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
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
