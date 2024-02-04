import 'package:muebleslav/core/color.dart';
import 'package:flutter/material.dart';
import 'package:muebleslav/core/space.dart';
import 'package:muebleslav/core/text_style.dart';
import 'package:muebleslav/model/model.dart';
import 'package:muebleslav/page/details_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCard extends StatelessWidget {
  final Model model;
  const ItemCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => DetailsPage(model: model)));
      },
      child: Container(
        height: 140.0,
        margin: const EdgeInsets.only(bottom: 30.0,left: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 140.0,
              child: Image.asset(model.image[0]),
            ),
            Flexible(
              //Container
              //width: 180.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    children: [
                      
                      const SpaceVH(width: 10,),
                      
                      Text(
                        model.name,
                        style: itemCardHeading,
                      ),
                    ],
                  ),
                  
                  const SpaceVH(height: 10.0),
                  // const Text(
                  //   'Precio accesibles',
                  //   maxLines: 3,
                  //   style: itemCardDes,
                  // ),
                  // const SpaceVH(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SpaceVH(width: 10),
                      const Icon(
                        Icons.info_outline,
                        color: Colors.black45,
                        ),

                      const SpaceVH(width: 10.0,),
                      
                      Text(
                        model.price,
                        style: itemCardPrice,
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              splashColor: Colors.red,
              icon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
