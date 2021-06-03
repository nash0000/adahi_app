//import 'package:adahi_app/screens/butcher/products_screen.dart';
import 'package:adahi_app/screens/mainpage/navigationdrawerwidget.dart';
import 'package:adahi_app/screens/mainpage/navigationprovider.dart';
//import 'package:adahi_app/shared/components/components.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  static final String title = 'choose your place!';
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.teal),
          home: MainPage(),
        ),
      );
}

////////////////////
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var selectedCitiy, selectedAreas, areaItems;
  List<String> cities = <String>[
    "Amman",
    "Zarqa",
    "Irbid",
    "Al Karak",
    "Ma'an",
    "Al Aqabah",
  ];
  var myCity;
  var myArea;
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(FirstPage.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  bottom: 100.0, top: 100.0, left: 10.0, right: 10.0),
              child: Text(
                "choose  your place",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
            ),
            /////////////////////////////////
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25,
                ),
                border: Border.all(
                  color: Colors.teal,
                  width: 1,
                ),
              ),
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          dropdownColor: Colors.teal[400],
                          value: selectedCitiy,
                          iconSize: 30,
                          icon: (null),
                          //Icon(Icons.place),
                          //
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                          hint: Text(
                            'select City',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          onChanged: (cities) {
                            setState(() {
                              selectedCitiy = cities;
                              // cities();
                              print('$cities');
                            });
                          },

                          isExpanded: false,
                          items: cities.map((item) {
                                return new DropdownMenuItem(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  value: item,
                                );
                              })?.toList() ??
                              [],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            //////////////////////////////////////////////////////
            //
            // StreamBuilder(
            //     stream:
            //         FirebaseFirestore.instance.collection("Areas").snapshots(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (!snapshot.hasData) {
            //         Text("loading .... ");
            //       } else {
            //         List<DropdownMenuItem> areaItems = [];
            //         for (int i = 0; i < snapshot.data!.docs.length; i++) {
            //           DocumentSnapshot snap = snapshot.data!.docs[i];
            //           areaItems.add(
            //             DropdownMenuItem(
            //               child: Text(
            //                 snap['title'],
            //                 style: TextStyle(
            //                     color: Colors.black87,
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               value: "${snap.id}",
            //               //  areaItems,"${snap.id}",
            //             ),
            //           );
            //         }
            //         return Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: <Widget>[
            //             Icon(null),
            //             Container(
            //               margin: EdgeInsets.only(left: 10.0, right: 10.0),
            //               padding: EdgeInsets.only(
            //                   left: 15.0, right: 15.0, top: 5.0),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(
            //                   25,
            //                 ),
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.grey.withOpacity(0.2),
            //                     spreadRadius: 2,
            //                     blurRadius: 2,
            //                   ),
            //                 ],
            //                 // border: Border.all(
            //                 //   color: Colors.teal,
            //                 //   width: 1,
            //                 // ),
            //               ),
            //               child: Center(
            //                 child: Column(
            //                   children: [
            //                     DropdownButton(
            //                       dropdownColor: Colors.teal[400],
            //                       items: areaItems,
            //                       //Text(item['title']),
            //                       //areaItems,
            //                       onChanged: (areaValue) {
            //                         setState(() {
            //                           selectedAreas = areaValue;
            //
            //                           navigateTo(context, ProductsScreen());
            //                         });
            //                       },
            //                       value: selectedAreas,
            //                       //selectedAreas,
            //                       isExpanded: false,
            //                       hint: Text("choose your place please!"),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         );
            //       }
            //       return Container();
            //     }),
            ////////////2/////
            // StreamBuilder(
            //     stream:
            //         FirebaseFirestore.instance.collection("Areas").snapshots(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (!snapshot.hasData) {
            //         Text("loading .... ");
            //       } else {
            //         List<DropdownMenuItem> areaItems = [];
            //         for (int i = 0; i < snapshot.data.docs.length; i++) {
            //           DocumentSnapshot snap = snapshot.data.docs[i];
            //           areaItems.add(
            //             DropdownMenuItem(
            //               child: Text(
            //                 snap.id,
            //                 style: TextStyle(
            //                   color: Colors.black54,
            //                   fontSize: 16,
            //                 ),
            //               ),
            //               value: "${snap.id}",
            //             ),
            //       );
            //     }
            //   }
            //
            //   return Container(
            //     margin: EdgeInsets.only(left: 10.0, right: 10.0),
            //     padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(
            //         25,
            //       ),
            //       border: Border.all(
            //         color: Colors.teal,
            //         width: 1,
            //       ),
            //     ),
            //     color: Colors.white,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         Expanded(
            //           child: DropdownButtonHideUnderline(
            //             child: ButtonTheme(
            //               alignedDropdown: true,
            //               child: DropdownButton<String>(
            //                 dropdownColor: Colors.teal[400],
            //                 value: areaItems,
            //                 iconSize: 30,
            //                 icon: (null),
            //                 //Icon(Icons.place),
            //                 //
            //                 style: TextStyle(
            //                   color: Colors.black54,
            //                   fontSize: 16,
            //                 ),
            //                 hint: Text(
            //                   'select Area',
            //                   style: TextStyle(
            //                     color: Colors.black54,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //                 onChanged: (areaValue) {
            //                   setState(() {
            //                     selectedAreas = areaValue;
            //                     navigateTo(context, ProductsScreen());
            //                     // cities();
            //                     print('$areaValue');
            //                   });
            //                 },
            //
            //                 isExpanded: false,
            //                 items: selectedAreas.map((item) {
            //                       return DropdownMenuItem(
            //                         child: Text(
            //                           item['title'],
            //                           style: TextStyle(
            //                               color: Colors.black87,
            //                               fontWeight: FontWeight.bold),
            //                         ),
            //                         value: item['id'].toString(),
            //                       );
            //                     })?.toList() ??
            //                     [],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //       // ),
            //     ),
            //   );
            // }),
            // SizedBox(
            //  height: 20.0,
            // )
            // ///////////2////
            // FirebaseFirestore.instance.collection("Areas").snapshots(),
            // List<DropdownMenuItem> areaItems = [];
          ],
        ),
      );
}

//<QuerySnapshot>
