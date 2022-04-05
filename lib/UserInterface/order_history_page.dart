// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fuel_2/ColorConstants.dart';
import 'package:easy_fuel_2/UserInterface/profile_page.dart';
import 'package:easy_fuel_2/UserInterface/progress_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_time_patterns.dart';

import 'order_info.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class OrderHistory extends StatelessWidget {
   OrderHistory({Key? key}) : super(key: key);

   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.
  collection('Fuel').where('Uid', isEqualTo:auth.currentUser?.uid ).snapshots();

   String status = '0';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order History',
      home: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      return  GestureDetector(
                        onTap: (){
                          status = data['status'].toString();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  OrderInfo(text: 'w',)),
                          );
                        },
                        child:  Container(
                          height: 150,
                          child: Card(
                            color: secondColor,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 33,
                                  child: Icon(Icons.local_gas_station,
                                    size: 60,
                                    color: kBlueColor,
                                  ),
                                ),
                                Expanded(
                                  flex: 66,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 50,
                                        child: Center(child:
                                        Text(
                                            data['type'].toString(),
                                            style: TextStyle(
                                          fontSize: 18,
                                          color: kBlueColor,
                                        )
                                        )),
                                      ),
                                      Expanded(
                                        flex: 25,
                                        child: Center(child: Text(data['liter'].toString())),
                                      ),
                                      Expanded(flex: 25, child: Text('Total : R'+data['total'].toString())),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
}