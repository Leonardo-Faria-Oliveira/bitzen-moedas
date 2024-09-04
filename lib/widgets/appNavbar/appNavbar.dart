

import 'package:flutter/material.dart';

class AppNavbar extends StatelessWidget implements PreferredSizeWidget{

  const AppNavbar({super.key});

  @override
  Widget build(BuildContext context){
    return AppBar(
            actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                
              },
            )
          ],
          toolbarHeight: 88,        
          title: const Image(
          image: AssetImage("assets/logo-bitzen.png"),
          height: 45,
          width: 36,
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      );
  }

    @override
    Size get preferredSize => const Size.fromHeight(88.0); // Altura preferida do AppNavbar

}