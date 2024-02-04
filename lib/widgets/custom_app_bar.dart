
import 'package:flutter/material.dart';
import 'package:muebleslav/core/color.dart';

// ignore: camel_case_types
class customAppBar extends StatelessWidget {
  const customAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      margin: const EdgeInsets.only(top: 50.0),
      height: 80.0,
      child: Scaffold(
        appBar: AppBar(),
        drawer: const Drawer(),
      ),

      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     //Icon(Icons.menu),
      //     InkWell(
      //       onTap: () {
      //         print("boton verde de menu");
      //       },
      //       splashColor: white,
      //       child: Container(
      //         height: 65.0,
      //         width: 50.0,
      //         decoration: BoxDecoration(
      //           color: green,
      //           borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(20.0),
      //             topRight: Radius.circular(10.0),
      //             bottomLeft: Radius.circular(20.0),
      //             bottomRight: Radius.circular(50.0),
      //           ),
      //         ),
      //         // child: Icon(
      //         //   Icons.menu,
      //         //   color: white,
      //         // ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
