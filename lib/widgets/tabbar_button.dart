import 'package:flutter/material.dart';
import 'package:muebleslav/core/color.dart';
import 'package:muebleslav/core/text_style.dart';
import 'package:muebleslav/data/tab_bar_menu.dart';

class TabBarButton extends StatefulWidget {
  const TabBarButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarButtonState createState() => _TabBarButtonState();
}

class _TabBarButtonState extends State<TabBarButton> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0;
            i < tabBarMenu.length;
            i++) // creacion de menu all chairs lamps tables
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                id = tabBarMenu[i].id;
                //print("holaaaaaaaaaaaaaaaaaaa");
              });
            },
            child: Container(
              height: 40.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: id == i ? gray : Colors.transparent,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Center(
                child: Text(
                  tabBarMenu[i].name,
                  style: id == i ? tabButtonS : tabButtonU,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
