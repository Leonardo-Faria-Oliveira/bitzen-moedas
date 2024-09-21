import 'package:bitzen_moedas/models/price.dart';
import 'package:bitzen_moedas/repositories/price.repository.dart';
import 'package:bitzen_moedas/utils/convert_timestamp.dart';
import 'package:bitzen_moedas/widgets/pricesDataTable/prices_data_table.dart';
import 'package:flutter/material.dart';
import 'package:bitzen_moedas/enums/dashboard_type.dart';
import 'package:bitzen_moedas/widgets/appNavbar/app_navbar.dart';

import '../pricesChart/prices_chart.dart';

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
                  const SizedBox(height: 40), // Espaço horizontal de 40 pixels
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width, // 80% of the screen width
                        height: 900, // 80% of the screen height
                        child: Column(
                          verticalDirection: VerticalDirection.down,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PricesChart(prices: snapshot.data!),
                            const SizedBox(height: 40), // Espaço horizontal de 40 pixels
                            PricesDataTable(prices: snapshot.data!)
                          ],
                        ),
                      ),
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
