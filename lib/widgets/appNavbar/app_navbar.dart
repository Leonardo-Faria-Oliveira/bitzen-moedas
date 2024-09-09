import 'package:flutter/material.dart';

class AppNavbar extends StatefulWidget implements PreferredSizeWidget{

  const AppNavbar({super.key});

  @override 
  State<AppNavbar> createState() => AppNavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(88.0);

}

class AppNavbarState extends State<AppNavbar>{

  Color menuColor = Colors.white;
  Color backgroundColor = Colors.cyan;
  String mainLogo = "assets/logo-bitzen.png";

  void _showPopupMenu() async {
 //*get the render box from the context
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        //*get the global position, from the widget local position
        final offset = renderBox.localToGlobal(Offset.zero);
        //*calculate the start point in this case, below the button
        final left = offset.dx;
        final top = offset.dy + renderBox.size.height;
        //*The right does not indicates the width
        final right = left + renderBox.size.width;
        //*show the menu
        final value = await showMenu<String>(
          // color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          context: context, 
          position: RelativeRect.fromLTRB(left, top, right, 0.0), 
          items: [
            PopupMenuItem<String>(
                child: const Text('Doge'), value: 'Doge'),
            PopupMenuItem<String>(
                child: const Text('Lion'), value: 'Lion'),
          ],
        );
}

  @override
  Widget build(BuildContext context){
    return AppBar(
          actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: menuColor, // Remove the 'const' keyword
            ),
            onPressed: () {
              setState(() {
                menuColor = Colors.cyan;
                backgroundColor = Colors.white;
                mainLogo = "assets/logo-bitzen";
                _showPopupMenu();
              });
            },
          )
        ],
        toolbarHeight: 88,        
        title: Image.asset(
          mainLogo,
          height: 45,
          width: 36,
        ),
      backgroundColor: backgroundColor,
      centerTitle: true,
    );
  }

  

}