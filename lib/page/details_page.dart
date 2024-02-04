import 'package:flutter/material.dart';
import 'package:muebleslav/core/color.dart';
import 'package:muebleslav/core/space.dart';
import 'package:muebleslav/core/text_style.dart';
import 'package:muebleslav/model/model.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  final Model model;
  const DetailsPage({super.key, required this.model});

  @override
  // ignore: library_private_types_in_public_api
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectIndex = 0;
  int qty = 1;

  // Future<void> _launchURL() async{

  //   //https://api.whatsapp.com/send?phone=+522297687340&text=hola
  //   //https://api.whatsapp.com/send?phone=+522297687340&text=Hola%20Mueblues%20luv!,%20Me%20gustar%C3%ADa%20tener%20un%20poco%20m%C3%A1s%20de%20informaci%C3%B3n%20acerca%20sus%20productos.!

  //   final uri = Uri.parse('https://api.whatsapp.com/send?phone=+522297687340&text=Hola%20Mueblues%20luv!,%20Me%20gustar%C3%ADa%20tener%20un%20poco%20m%C3%A1s%20de%20informaci%C3%B3n%20acerca%20sus%20productos'); //https://api.whatsapp.com/send?phone=+522297687340&text=Hola%20Mueblues%20luv!,%20Me%20gustar%C3%ADa%20tener%20un%20poco%20m%C3%A1s%20de%20informaci%C3%B3n%20acerca%20sus%20productos

  //   // final Uri uri = Uri(
  //   //   scheme: 'https', 
  //   //   host: 'api.whatsapp.com',
  //   //   path: '/send',
  //   //   //queryParameters: {'phone':'+522297687340','text':'hola'}); // sirve cuando hay un ?
  //   //   queryParameters: {'phone':'+522297687340','text':'Hola Mueblues luv!. Me gustaria tener un poco mas de informacion acerca sus productos.!'}); // sirve cuando hay un ?
  //   //   //{: = =} , {, = &} 
  //   if(!await launchUrl(
  //     uri,
  //     mode: LaunchMode.externalApplication,
  //   )){
  //     throw "can not lauch url";
  //   }
  // }

  Future<void> _launchURLfacebook() async{
    final uri = Uri.parse('https://www.facebook.com/people/Muebles-Lav/61555544997540/?mibextid=ZbWKwL');
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )){
      throw "can not lauch url";
    }
  }

  Future<void> _launchURLWhatsapp() async{
    final uri = Uri.parse('https://api.whatsapp.com/send?phone=+522297687340&text=Hola%20Mueblues%20luv!,%20Me%20gustar%C3%ADa%20tener%20un%20poco%20m%C3%A1s%20de%20informaci%C3%B3n%20acerca%20sus%20productos');
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )){
      throw "can not lauch url";
    }
  }

  Future<void> _launchURLWeb() async{
    final uri = Uri.parse('https://muebleslav.live');
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )){
      throw "can not lauch url";
    }
  }

  Future<void> _launchURLStore() async{
    final uri = Uri.parse('https://muebleslav.live/tienda/');
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )){
      throw "can not lauch url";
    }
  }



  @override
  Widget build(BuildContext context) {
   // final height = MediaQuery.of(context).size.height;


//final String images2 = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      //backgroundColor: Colors.amber,
      //body: Center(child: Text(images2[0].toString()),),
      //body: Center(child: Image.asset( images2[0]),)
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10.0,
            ),
            
            //_posterTitulo(context, "images2.toString()"),
            _descripcion(context),
          ]))
        ],
      ),
    );
  }

  Widget _crearAppBar() {

    
    return  SliverAppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ), //cambiar color de iconos en appbar
      elevation: 2.0,
      backgroundColor: Colors.blue,
      expandedHeight: 150.0,
      floating: true,
      pinned: true,
      forceElevated: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(20),
        centerTitle: false,
        title: Text("        ${widget.model.name}",
          //style: itemCardDes, 
          style: itemCardDes.copyWith(color: Colors.white),
          //style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/images/f7.jpg'),
          image: AssetImage('assets/images/f8.jpg'), 
          fadeInDuration: Duration(milliseconds: 1500),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Widget _posterTitulo(BuildContext context, String index1) {
  //   return Container(



      
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //     child: Row(
  //       children: <Widget>[
  //         ClipRRect(
  //           borderRadius: BorderRadius.circular(20.0),
  //           child: const Image(
  //             //image: AssetImage('assets/$index1.jpg'),
  //             image: AssetImage('assets/images/logo01.png'),
  //             height: 150.0,
  //           ),
  //         ),
  //         const SizedBox(width: 20.0),
  //         const Flexible(
  //             child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text('DISCIPULADO',
  //                 style: TextStyle(color: Colors.blueGrey, fontSize: 16.0)),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             SelectableText(
  //               'VOLUMEN 1',
  //               textAlign: TextAlign.left,
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Text(
  //               'CAPITULOS',
  //               textAlign: TextAlign.justify,
  //             ),
  //             Row(
  //               children: <Widget>[
  //                 Icon(Icons.accessibility),
  //                 //Text('Fuentes:', style: TextStyle(color: Colors.blueGrey, fontSize: 16.0))
  //               ],
  //             )
  //           ],
  //         ))
  //       ],
  //     ),
  //   );
  // }

List<Widget> getRandomWidgetArray(){

            List <Widget> gameCells = <Widget>[];
            for(var i in widget.model.image)
            {
                gameCells.add(Image.asset(i));
            }
            return gameCells;
          }


  Widget _descripcion(context) {
    
    final height = MediaQuery.of(context).size.height;
    
    
    return Container(
        
        
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

        Column(
        children: [
      
          SizedBox( // imagen central
            height: height / 2.0,
            child: Stack(
              children: [
                Positioned(
                  left: 1,
                  top: height / 30.0,
                  child: Container(
                    width: 60.0,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.3),
                          offset: const Offset(5, 5),
                          blurRadius: 10.0,
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < widget.model.image.length; i++)
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectIndex = i;
                              });
                            },
                            child: Container(
                              height: 53,
                              width: 60,
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Image.asset(widget.model.image[i]),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                Padding( // imagen central
                  padding: const EdgeInsets.only(right: 10.0, top: 10, ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      widget.model.image[selectIndex],
                      fit: BoxFit.cover,
                      width: height / 3.0, // tamaño imagen central
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 5, width: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // const SpaceVH(width: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    SizedBox.fromSize(
                        size: const Size(96, 56), // button width and height
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Material(
                            color: Colors.orangeAccent, // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {
                                _launchURLWeb();
                                //print("hola");
                                //_launchURL("//api.whatsapp.com/send?phone=+522297687340&text=Hola%20Mueblues%20luv!,%20Me%20gustar%C3%ADa%20tener%20un%20poco%20m%C3%A1s%20de%20informaci%C3%B3n%20acerca%20sus%20productos");
                              }, // button pressed
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.store, color: Colors.white, ), // icon
                                  SizedBox(width: 5,height: 5,),
                                  Center(
                                    child: Text("Tienda", 
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,),
                                              ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SpaceVH(width: 10.0),

                      SizedBox.fromSize(
                        size: const Size(96, 56), // button width and height
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Material(
                            color: const Color.fromRGBO(59, 89, 152, 1), // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {
                                _launchURLfacebook();
                                //print("hola");
                                //_launchURL("//api.whatsapp.com/send?phone=+522297687340&text=Hola%20Mueblues%20luv!,%20Me%20gustar%C3%ADa%20tener%20un%20poco%20m%C3%A1s%20de%20informaci%C3%B3n%20acerca%20sus%20productos");
                              }, // button pressed
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.facebook, color: Colors.white, ), // icon
                                  SizedBox(width: 5,height: 5,),
                                  Center(
                                    child: Text("Facebook", 
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,),
                                              ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SpaceVH(width: 10.0),

                      SizedBox.fromSize(
                        size: const Size(96, 56), // button width and height
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Material(
                            color: const Color.fromRGBO(37, 211, 102, 1), // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {
                                _launchURLWhatsapp();
                                //print("hola");
                                //_launchURL("//api.whatsapp.com/send?phone=+522297687340&text=Hola%20Mueblues%20luv!,%20Me%20gustar%C3%ADa%20tener%20un%20poco%20m%C3%A1s%20de%20informaci%C3%B3n%20acerca%20sus%20productos");
                              }, // button pressed
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.whatsapp, color: Colors.white, ), // icon
                                  SizedBox(width: 5,height: 5,),
                                  Center(
                                    child: Text("Chat", 
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,),
                                              ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      


                  ],
                ),

                const SpaceVH(height: 20.0),

                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.model.description,
                          style: itemCardDes,                    
                        ),
                      ),
                      // Text(
                      //   widget.model.detalles,
                      //   style: itemCardDes,                    
                      // ),
                    ],
                  ),
                const SpaceVH(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Text(
                      "Especificaciones",
                      style: heading.copyWith(fontSize: 28.0),
                    ),
                  ],
                ),
                const SpaceVH(height: 10.0),
                
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.model.detalles,
                          style: itemCardDes,                    
                        ),
                      ),
                      // Text(
                      //   widget.model.detalles,
                      //   style: itemCardDes,                    
                      // ),
                    ],
                  ),
                const SpaceVH(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Precios en Caobilla",
                      style: heading.copyWith(fontSize: 28.0),
                    ),
                  ],
                ),

                const SpaceVH(height: 10.0),



                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.model.profundidades,
                      style: itemCardDes,                      
                    ),
                    
                    Text(
                      widget.model.precios,
                      style: itemCardDes,                    
                    ),
                  ],
                ),
                
                const SpaceVH(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Precios en PVC",
                      style: heading.copyWith(fontSize: 28.0),
                    ),
                  ],
                ),

                const SpaceVH(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.model.profundidades,
                      style: itemCardDes,                      
                    ),
                    
                    Text(
                      widget.model.preciosPVC,
                      style: itemCardDes,                    
                    ),
                  ],
                ),

                const SpaceVH(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Colores caobilla",
                      style: heading.copyWith(fontSize: 28.0),
                    ),
                  ],
                ),

                const SpaceVH(height: 10.0),

                Row( // PALETA DE COLORES CAOBILLA
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/AMARANTO.png', fit: BoxFit.fill),
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Amaranto"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/ARCE.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Arce"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/CAOBACLASICO.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Caoba"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/CAOBAINGLES.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Caoba 2"),

                            ],
                          ),

                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/CEDRO.png', fit: BoxFit.fill),
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Cedro"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/EARLYAMERICAN.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Early"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/MAGNOLIA.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Magnolia"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/MAPLE.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Maple"),

                              
                            ],
                          ),

                              

                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              
                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/NOGALAMERICANO.png', fit: BoxFit.fill),
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Nogal"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/NOGALCLASICO.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Nogal 2"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/aqua/ROBLE.png', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Roble"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/mancha/CHOCOLATE.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Chocolate"),


                            ],
                          ),
                  ],
                ),

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [

                //     Column(
                //       children:[

                //         SingleChildScrollView(
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: SizedBox(
                //               height: MediaQuery.of(context).size.height,
                //               child: Column(
                //                 children: [
                //                   CarouselSlider(
                //                     //items: myitems, 
                //                     items: ListTwo, 
                //                     options: CarouselOptions(
                //                       autoPlay: true,
                //                       height: 200,
                //                       onPageChanged: ((index, reason) {
                //                         setState(() {
                //                           myCurrentIndex = index;
                //                         });
                //                       })
                //                     ))
                //                 ],
                //               ),
                //             ),
                //           ),
                //         )
                          
                        
                //         ]
                //       ),
                                        
                    
                //   ],
                // ),

                const SpaceVH(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Colores Marmol PVC",
                      style: heading.copyWith(fontSize: 28.0),
                    ),
                  ],
                ),

                const SpaceVH(height: 10.0),

                Row( // PALETA DE COLORES CAOBILLA
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/mineral-wall-rock-hard-strong.jpg', fit: BoxFit.fill),
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("A"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/2020-02-27-02-26-24_U50_detail.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("B"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/2020-02-27-03-44-11_MK14_detail.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("C"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/2020-02-27-03-46-01_NE72_detail.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("D"),

                            ],
                          ),

                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/2020-12-16-05-49-53_NG31_795X795.jpg', fit: BoxFit.fill),
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("E"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/2020-12-21-01-54-00_NF99.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("F"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/2021-01-04-12-29-17_Nf98_795X795.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("G"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/brown-scratched-marble-textured-background.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("H"),

                              
                            ],
                          ),

                              

                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              
                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/close-up-black-marble-background.jpg', fit: BoxFit.fill),
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("I"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/close-up-green-marble-texture-background.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("J"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/close-up-white-marble-texture-background.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("K"),

                              const SpaceVH(height: 10.0),

                              ClipOval(
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(30), // Image radius
                                  child: Image.asset('assets/images/marmol/grungy-green-marble-textured.jpg', fit: BoxFit.fill),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("L"),


                            ],
                          ),
                  ],
                ),

                const SpaceVH(height: 10.0),

                const SpaceVH(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Colores PVC",
                      style: heading.copyWith(fontSize: 28.0),
                    ),
                  ],
                ),

                const SpaceVH(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb00cb00),
                                  shape: BoxShape.circle,
                                  
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Apple"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb290f00),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Cafe"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb002b1a),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Bosque"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb019316),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Verde"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb012e55),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb0096f4),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 2"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb8a8a7e),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Gris"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb000928),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 3"),

                              const SpaceVH(height: 10.0),

                            Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb000000),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Cedro66"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 4.0,
                                  ),
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Blanco"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb010413),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 5"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb70d7f6),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 6"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbff2d14),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Rojo"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb3e3e3e),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Gris 2"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb0027cd),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 7"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb026e61),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Turquesa"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb9ea092),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Gris 3"),





                            ],
                          ),


                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbe7e5b5),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Beige"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb282c2d),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Charcoal"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbffa304),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Amarillo"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbdcddd7),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Gris 2"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb00061c),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 4"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbfe3917),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Naranja"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbff9201),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Flower"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb920005),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Vino"),

                              const SpaceVH(height: 10.0),


                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb000000),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Cedro4"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb004ecc),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 8"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb003320),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Verde 4"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb7461ba),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Lavanda"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbefe60f),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Amarillo 5"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbfe201d),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Rojo 2"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbece91e),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Amarillo 6"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb001044),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 9"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb019316),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Verde 5"),



                              
                            ],
                          ),

                    
                Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb000000),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Negro"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbd90009),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Crimson"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb00531f),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Verde 2"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbfe4701),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Naranja 2"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb006323),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Verde 3"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbff5500),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Naranja 3"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbefb400),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Amarillo 2"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbf2d400),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Amarillo 3"),

                              const SpaceVH(height: 10.0),


                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbf2d400),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Amarillo 4"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb070b55),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 10"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbfd1f1c),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Rojo 3"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbd3e61b),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Limon"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbfd236d),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              // Container(
                              //   height: 50,
                              //   width: 50,
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(0, 203, 0, 1),
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),

                              const SpaceVH(height: 5.0),

                              const Text("Magenta"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb0aeed5),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Azul 11"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbfd2018),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Rojo 4"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb2b0045),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Violeta"),

                              const SpaceVH(height: 10.0),

                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xffb3b1500),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              const SpaceVH(height: 5.0),

                              const Text("Cafe 2"),



                              
                            ],
                          ),
                  ],
                ),

                const SpaceVH(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Comuniquese con \n',
                          style: subHeading,
                        ),
                        TextSpan(
                          text: 'nosotros',
                          style: itemCardHeading,
                        ),
                      ]),
                    ),

                    SizedBox.fromSize(
                        size: const Size(96, 56), // button width and height
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Material(
                            color: const Color.fromRGBO(37, 211, 102, 1), // button color
                            child: InkWell(
                              splashColor: Colors.red, // splash color
                              onTap: () {
                                _launchURLWhatsapp();
                              }, // button pressed
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.whatsapp, color: Colors.white, ), // icon
                                  SizedBox(width: 5,height: 5,),
                                  Center(
                                    child: Text("ventas", 
                                            style: TextStyle(
                                              color: black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,),
                                              ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    // Container(
                    //   height: 40.0,
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   decoration: BoxDecoration(
                    //     color: red,
                    //     borderRadius: BorderRadius.circular(50.0),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       'Buy Now',
                    //       style: itemCardHeading.copyWith(color: white),
                    //     ),
                    //   ),
                    // )
                  ],
                )
              ],
            ),
          )
        ],
      ),

            //--------------------




                    //           TextButton(
                    //             child: const Text('CAPITULO II: Bibliología (Biblia)'),
                    //             onPressed: (){

                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( 
                                                                  
                    //                                               // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Bibliologia()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );

                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Bautismo()),
                    // // );

                    //           }, ),


                    //           TextButton(
                    //             child: const Text('CAPITULO III: Cristología (Jesucristo)'),
                    //             onPressed: (){

                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           // //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Cristologia()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );


                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Cristologia()),
                    // // );

                    //           }, ),

                    //           TextButton(
                    //             child: const Text('CAPITULO IV: Bautismo'),
                    //             onPressed: (){

                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Bautismo()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );
                    
                    
                    
                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Bautismo()),
                    // // );

                    //           }, ),


                    //           TextButton(
                    //             child: const Text('CAPITULO V: Dios'),
                    //             onPressed: (){

                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Dios()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );


                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Dios()),
                    // // );

                    //           }, ),


                    //           TextButton(
                    //             child: const Text('CAPITULO VI: Espiritu Santo (Pneumatología)'),
                    //             onPressed: (){

                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Espiritu()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );


                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Espiritu()),
                    // // );

                    //           }, ),

                    //           TextButton(
                    //             child: const Text('CAPITULO VII: Santa Cena'),
                    //             onPressed: (){
                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           // //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Cena()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );


                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Cena()),
                    // // );

                    //           }, ),

                    //           TextButton(
                    //             child: const Text('CAPITULO VIII: Iglesia Local'),
                    //             onPressed: (){
                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Iglesia()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );
                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Iglesia()),
                    // // );

                    //           }, ),

                    //           TextButton(
                    //             child: const Text('CAPITULO IX: Evangelismo mundial'),
                    //             onPressed: (){
                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                               // controller: myController,
                    //                                               // decoration:const InputDecoration(
                    //                                               //             isDense: true,
                    //                                               //             contentPadding:EdgeInsets.all(0),
                    //                                               //             hintText: " password",
                    //                                               //             hintStyle: TextStyle(fontSize: 14)
                    //                                               //             ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Evangelismo()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );
                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Evangelismo()),
                    // // );

                    //           }, ),

                    //           TextButton(
                    //             child: const Text('CAPITULO X: Consejos practicos'),
                    //             onPressed: (){
                    //               showDialog(
                    //                 context: context,
                    //                 builder: (buildcontext) {
                    //                 return AlertDialog(
                    //                           scrollable: true,
                    //                           //title: const Text("Hechos 2:41"),
                    //                           title: const Text("Contraseña"),
                    //                           //content: const Text("Así que, los que recibieron su palabra fueron bautizados; y se añadieron aquel día como tres mil personas."),
                    //                           content: TextField( // TEXTFIELD
                    //                                           //     controller: myController,
                    //                                           //     decoration:const InputDecoration(
                    //                                           //                 isDense: true,
                    //                                           //                 contentPadding:EdgeInsets.all(0),
                    //                                           //                 hintText: " password",
                    //                                           //                 hintStyle: TextStyle(fontSize: 14)
                    //                                           //                 ),
                    //                                           ),
                            
                    //                           actions: <Widget>[
                    //                                           ElevatedButton(
                    //                                             child: const Text("IR", style: TextStyle(color: Colors.white),),
                    //                                             onPressed: (){ 
                    //                                                           // Navigator.of(context).pop(); 
                    //                                                           //print(myController.text); //probar que el texto del textField sea leido
                    //                                                           // if (myController.text == "baptism") { // comparar el texto de mycontroller del textfield con la contraseña
                    //                                                           //       Navigator.push(
                    //                                                           //       context,
                    //                                                           //       MaterialPageRoute(builder: (context) => Bibliologia()), );
                    //                                                           //       myController.text = "";
                    //                                                           // } else {
                    //                                                           //       Navigator.of(context).pop(); 
                    //                                                           //       myController.text = "";                                                             
                    //                                                           // }
                                                                  
                    //                                                       },
                    //           )
                    //         ],
                    //       );
                    //     }
                    //   );
                    // //             Navigator.push(
                    // //                             context,
                    // //                             MaterialPageRoute(builder: (context) => Bautismo()),
                    // // );

                    //           }, ),

                              // Image.asset('assets/cruz.png'),
            // const SelectableText(
            //   'bc1q7xkn2rzkwe6dkh78jx2mz3sktcxcl9p0rgehk8',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            // const Text(
            //   'The BTC address can be selected and copied for ease.',
            //   textAlign: TextAlign.justify,
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // //Text('Libro: Lorenzo, J., Murga, G., & Ferreiro y Peralto, M. (1864). Diccionario marítimo español. Madrid: Establecimiento Tipográfico de T. Fortanet.',textAlign: TextAlign.justify,),
            // // Text(
            // //   'Libro: ',
            // //   textAlign: TextAlign.justify,
            // // ),
            // // SizedBox(
            // //   height: 20,
            // // ),
            // const Text(
            //   'Images: https://pixabay.com/es/ ',
            //   textAlign: TextAlign.justify,
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // //Text('Autor: Norberto M.G. ',textAlign: TextAlign.justify,),
            // //SizedBox(height: 20,),
            // const Text(
            //   'Info: celladvanced@gmail.com',
            //   textAlign: TextAlign.justify,
            // ),
            //  const SizedBox(
            //   height: 10.0,
            // ),
            // const Text(
            //   'MORE APPS IN THE PLAYSTORE',
            //   textAlign: TextAlign.justify,
            // ),
            // const SizedBox(
            //   height: 10.0,
            // ),
            // const SelectableText(
            //   'https://play.google.com/store/apps/developer?id=Cella+Advanced&hl=es',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
          ],
        )
      );
  }
}

  

          //**************************************************** */


          // SliverAppBar(
          //       iconTheme: IconThemeData(
          //         color: Colors.white,
          //       ), //cambiar color de iconos en appbar
          //       elevation: 2.0,
          //       backgroundColor: Colors.indigoAccent,
          //       expandedHeight: 150.0,
          //       floating: true,
          //       pinned: true,
          //       forceElevated: true,
          //       stretch: true,
          //       flexibleSpace: FlexibleSpaceBar(
          //         titlePadding: EdgeInsets.all(20),
          //         centerTitle: false,
          //         title: Text(
          //           '       DISCIPULADO',
          //           style: TextStyle(color: Colors.white, fontSize: 16.0),
          //         ),
          //         background: FadeInImage(
          //           placeholder: AssetImage('assets/images/logo01.png'),
          //           image: AssetImage('assets/images/logo01.png'),
          //           fadeInDuration: Duration(milliseconds: 1500),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          
          




//*************************************************** */

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0.0,
    //     leading: IconButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       icon: const Icon(
    //         Icons.arrow_back_ios_new_outlined,
    //         color: black,
    //       ),
    //     ),
    //     centerTitle: true,
    //     title: Text(
    //       widget.model.category,
    //       style: itemCardHeading,
    //     ),
    //     actions: [
    //       IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.table_chart,
    //           color: black,
    //         ),
    //       )
    //     ],
    //   ),
      // body: Column(
      //   children: [
      
      //     SizedBox(
      //       height: height / 2.5,
      //       child: Stack(
      //         children: [
      //           Positioned(
      //             left: 1,
      //             top: height / 20.0,
      //             child: Container(
      //               width: 60.0,
      //               padding: const EdgeInsets.symmetric(vertical: 10.0),
      //               decoration: BoxDecoration(
      //                 color: white,
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: black.withOpacity(0.3),
      //                     offset: const Offset(5, 5),
      //                     blurRadius: 10.0,
      //                   ),
      //                 ],
      //                 borderRadius: const BorderRadius.only(
      //                   topRight: Radius.circular(20.0),
      //                   bottomRight: Radius.circular(20.0),
      //                 ),
      //               ),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   for (int i = 0; i < widget.model.image.length; i++)
      //                     InkWell(
      //                       onTap: () {
      //                         setState(() {
      //                           selectIndex = i;
      //                         });
      //                       },
      //                       child: Container(
      //                         height: 40,
      //                         width: 40,
      //                         margin: const EdgeInsets.symmetric(vertical: 5.0),
      //                         child: Image.asset(widget.model.image[i]),
      //                       ),
      //                     )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(right: 30.0),
      //             child: Align(
      //               alignment: Alignment.centerRight,
      //               child: Image.asset(
      //                 widget.model.image[selectIndex],
      //                 fit: BoxFit.cover,
      //                 width: height / 2.8,
      //               ),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     const SizedBox(height: 5, width: 20,),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 "Especificaciones",
      //                 style: heading.copyWith(fontSize: 28.0),
      //               ),
      //               // Container(
      //               //   height: 40,
      //               //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //               //   decoration: BoxDecoration(
      //               //     borderRadius: BorderRadius.circular(50.0),
      //               //     color: gray,
      //               //   ),
      //               //   child: Center(
      //               //     child: Row(
      //               //       children: [
      //               //         MaterialButton(
      //               //           minWidth: 10,
      //               //           onPressed: () {
      //               //             setState(() {
      //               //               qty++;
      //               //             });
      //               //           },
      //               //           child: Text(
      //               //             '+',
      //               //             style:
      //               //                 itemCardHeading.copyWith(color: lightBlack),
      //               //           ),
      //               //         ),
      //               //         Text(
      //               //           '$qty',
      //               //           style:
      //               //               itemCardHeading.copyWith(color: lightBlack),
      //               //         ),
      //               //         MaterialButton(
      //               //           minWidth: 10,
      //               //           onPressed: () {
      //               //             if (qty > 1) {
      //               //               setState(() {
      //               //                 qty--;
      //               //               });
      //               //             }
      //               //           },
      //               //           child: Text(
      //               //             '-',
      //               //             style:
      //               //                 itemCardHeading.copyWith(color: lightBlack),
      //               //           ),
      //               //         ),
      //               //       ],
      //               //     ),
      //               //   ),
      //               // ),
      //             ],
      //           ),
      //           const SpaceVH(height: 10.0),
                
      //           Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 Text(
      //                   widget.model.description,
      //                   style: itemCardDes,                    
      //                 ),
      //                 Text(
      //                   widget.model.detalles,
      //                   style: itemCardDes,                    
      //                 ),
      //               ],
      //             ),
               
      //           const SpaceVH(height: 20.0),

      //            Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text(
      //                 "Caobilla (madera)",
      //                 style: heading.copyWith(fontSize: 28.0),
      //               ),
      //             ],
      //           ),

      //           const SpaceVH(height: 10.0),



      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Text(
      //                 widget.model.profundidades,
      //                 style: itemCardDes,                      
      //               ),
                    
      //               Text(
      //                 widget.model.precios,
      //                 style: itemCardDes,                    
      //               ),
      //             ],
      //           ),
      //           const SpaceVH(height: 5.0),


      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               RichText(
      //                 text: const TextSpan(children: [
      //                   TextSpan(
      //                     text: 'Comuniquese con nuestros \n',
      //                     style: subHeading,
      //                   ),
      //                   TextSpan(
      //                     text: 'asesores de venta',
      //                     style: itemCardHeading,
      //                   ),
      //                 ]),
      //               ),

      //               SizedBox.fromSize(
      //                   size: const Size(96, 56), // button width and height
      //                   child: ClipRRect(
      //                     borderRadius: const BorderRadius.all(Radius.circular(15)),
      //                     child: Material(
      //                       color: const Color.fromRGBO(37, 211, 102, 1), // button color
      //                       child: InkWell(
      //                         splashColor: Colors.red, // splash color
      //                         onTap: () {
      //                           print("hola");
      //                         }, // button pressed
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: const <Widget>[
      //                             Icon(Icons.whatsapp, color: Colors.white, ), // icon
      //                             SizedBox(width: 5,height: 5,),
      //                             Center(
      //                               child: Text("ventas", 
      //                                       style: TextStyle(
      //                                         color: black,
      //                                         fontSize: 10,
      //                                         fontWeight: FontWeight.w700,),
      //                                         ),
      //                             )
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ),


      //               // Container(
      //               //   height: 40.0,
      //               //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //               //   decoration: BoxDecoration(
      //               //     color: red,
      //               //     borderRadius: BorderRadius.circular(50.0),
      //               //   ),
      //               //   child: Center(
      //               //     child: Text(
      //               //       'Buy Now',
      //               //       style: itemCardHeading.copyWith(color: white),
      //               //     ),
      //               //   ),
      //               // )
      //             ],
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    // );
//   }
// }