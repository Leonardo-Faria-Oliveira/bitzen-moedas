
import 'package:flutter/material.dart';
import 'package:bitzen_moedas/enums/dashboard_type.dart';
import 'package:bitzen_moedas/widgets/appNavbar/appNavbar.dart';


class Dashboard extends StatefulWidget{

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => DashboardState();

}

class DashboardState extends State<Dashboard>{

  DashboardType boardType = DashboardType.byLastSevenDays;

  int logNumber = 1;

  void setBoard(DashboardType type){
    boardType = type;
  }

  @override
  void initState(){
    super.initState();
  }

  void setLogNumber(int number){
    logNumber = number;
  }

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      appBar: AppNavbar(),
      body: Column(
          children: [
          Text(
            style: TextStyle(
              color: Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
            "Dashboard"
          )
        ],
      ),
    );
  }
}