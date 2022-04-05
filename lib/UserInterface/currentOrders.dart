// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fuel_2/ColorConstants.dart';
import 'package:easy_fuel_2/UserInterface/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';



void main() {
  runApp( currentOrders());


}
FirebaseAuth auth = FirebaseAuth.instance;

class currentOrders extends StatelessWidget {
  currentOrders({Key? key}) : super(key: key);

    bool delivery= false ;


   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.
  collection('Fuel').where('status', isEqualTo:'0' ).snapshots();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order History',
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            checkDelivery();
            // if( delivery==false){
            //   return Dialog(
            //     shape: RoundedRectangleBorder(
            //         borderRadius:
            //         BorderRadius.circular(20.0)), //this right here
            //     child: Container(
            //       height: 500,
            //       child: Padding(
            //         padding: const EdgeInsets.all(12.0),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             TextField(
            //               decoration: InputDecoration(
            //                   border: InputBorder.none,
            //                   hintText: 'You have to be registered as a '
            //                       'delivery person in your profile '),
            //             ),
            //             SizedBox(
            //               width: 320.0,
            //               child: ElevatedButton(
            //                 onPressed: () {
            //                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfile()));
            //                 },
            //                 child: Text(
            //                   "Go to Profile",
            //                   style: TextStyle(color: Colors.white),
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   );
            // }
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(
                    value: 0.8,
                    valueColor: new AlwaysStoppedAnimation<Color>(primaryColor),
                  )
              );
            }
            return Container(
                color: Colors.white70,

                child: ListView(
                  children:
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    
                    //(item) => item.id == '001'
                      return  Container(
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 33,
                              child: Image.network(
                                'https://cdn.24.co.za/files/Cms/General/d/10895/39028d1fc68c48648aae541c60d52822.jpg',
                              ),
                            ),
                            Expanded(
                              flex: 66,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 50,
                                    child: Center(child: Text('Type :'+data['type'].toString())),
                                  ),
                                  Expanded(flex: 25, child: Text('Total : '+data['total'].toString())),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
            );
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
    );

  }

  checkDelivery()  async {
    var prefs =  await SharedPreferences.getInstance();
    delivery = (prefs.getBool('delivery'))! ;
  }



}