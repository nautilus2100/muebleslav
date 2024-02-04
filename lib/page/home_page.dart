import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:muebleslav/core/color.dart';
import 'package:muebleslav/data/model_data_closet.dart';
import 'package:muebleslav/data/model_data_desk.dart';
import 'package:muebleslav/data/model_data_table.dart';
import 'package:flutter/material.dart';
//import 'package:muebleslav/core/color.dart';
//import 'package:muebleslav/core/space.dart';
//import 'package:muebleslav/core/text_style.dart';
import 'package:muebleslav/data/model_data.dart';
//import 'package:muebleslav/widgets/Custom_app_bar.dart';
import 'package:muebleslav/widgets/item_card.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:muebleslav/widgets/tabbar_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    
            return DefaultTabController(

                length: 4,
                child: Scaffold(
                  extendBodyBehindAppBar: false,
                  appBar: AppBar(
                    //shadowColor: Colors.transparent,
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    flexibleSpace: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors:
                            [
                            Colors.white, 
                            Colors.white,
                            ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      ),
                    
                    ),
                    title: const Text('Muebles Lav'),
                    //foregroundColor: Colors.blue,
                    bottom: const TabBar(
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.blue,
                      labelColor: Colors.blueAccent,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.table_chart_outlined),
                          child: Text('Closets')),
                        Tab(
                          icon: Icon(Icons.table_bar_outlined),
                          child: Text('Mesas')),
                        Tab(
                          icon: Icon(Icons.table_restaurant),
                          child: Text('Escritorio')),
                        Tab(
                          icon: Icon(Icons.tab_unselected_sharp),
                          child: Text('Panel')),
                              ]
                        ),
                    ),
                    drawer: Drawer(
                              child: ListView(
                                // Remove padding
                                padding: EdgeInsets.zero,
                                children: [
                                  const UserAccountsDrawerHeader(
                                    accountName: Text('MUEBLES LAV'),
                                    accountEmail: Text('muebleslav.live'),
                                    currentAccountPicture: CircleAvatar(
                                      child: ClipOval(
                                        child: Image(
                                          image: AssetImage('assets/images/lavlogo33.jpeg')),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage('assets/images/onlineStore4.jpeg'),

                                          // image: NetworkImage(
                                          //     'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
                                              ),
                                    ),
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.web_outlined),
                                    title: const Text('Sitio Web'),
                                    // ignore: avoid_returning_null_for_void
                                    onTap: () {
                                        _launchURLWeb();
                                      },

                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.facebook),
                                    title: const Text('Facebook'),
                                    // ignore: avoid_returning_null_for_void
                                    onTap: () {
                                        _launchURLfacebook();
                                      },
                                  ),
                                  ListTile(
                                    leading: const Icon(FontAwesomeIcons.whatsapp, color: green,),
                                    title: const Text('Whatsapp'),
                                    // ignore: avoid_returning_null_for_void
                                    onTap: () {
                                        _launchURLWhatsapp();
                                      },
                                  ),ListTile(
                                    leading: const Icon(Icons.store),
                                    title: const Text('Tienda'),
                                    // ignore: avoid_returning_null_for_void
                                    onTap: () {
                                        _launchURLStore();
                                      },
                                  ),
                                  const Divider(),
                                  ListTile(
                                    leading: const Icon(Icons.settings),
                                    title: const Text('Settings'),
                                    // ignore: avoid_returning_null_for_void
                                    onTap: () => null,
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.description),
                                    title: const Text('Policies'),
                                    // ignore: avoid_returning_null_for_void
                                    onTap: () => null,
                                  ),
                                  const Divider(),
                                  ListTile(
                                    title: const Text('Exit'),
                                    leading: const Icon(Icons.exit_to_app),
                                    // ignore: avoid_returning_null_for_void
                                    onTap: () => null,
                                  ),
                                ],
                              ),
                            ),

                    body: TabBarView(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.blueAccent
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,)
                          ),
                          //color: Colors.transparent,
                          child: ListView.builder(
                  padding: const EdgeInsets.all(1.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: models_closet.length,
                  itemBuilder: (builder, index) {
                    final model = models_closet[index];
                    return ItemCard(model: model);  
                    }
                  ),   
                        ),


                        Container(
                          
                          

                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.blueAccent
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,)
                          ),
                          child: ListView.builder(
                  padding: const EdgeInsets.all(1.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: models_table.length,
                  itemBuilder: (builder, index) {
                    final model = models_table[index];
                    return ItemCard(model: model);  
                    }
                  ),                          
                        ),




                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.blueAccent
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,)
                          ),
                          //color: Colors.transparent,
                          child: ListView.builder(
                  padding: const EdgeInsets.all(1.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: models_desk.length,
                  itemBuilder: (builder, index) {
                    final modelDesk = models_desk[index];
                    return ItemCard(model: modelDesk);  
                    }
                  ),   
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.blueAccent
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,)
                          ),
                          //color: Colors.transparent,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(1.0),
                              physics: const BouncingScrollPhysics(),
                              itemCount: models.length,
                              itemBuilder: (builder, index) {
                                final model = models[index];
                                return ItemCard(model: model);  
                            }
                          ),   
                        ),
                        
                      ]), 
                      ),

    );
  }

}
