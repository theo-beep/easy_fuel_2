import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fuel_2/Models/add_fuel_request.dart';
import 'package:easy_fuel_2/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

import '../Utils/geoLocationUtil.dart';

void fuelRequest(double cost ) async {
  // Obtain shared preferences.
  //final prefs = await SharedPreferences.getInstance();
  //final String? email = prefs.getString('userEmail');

  FirebaseAuth auth = FirebaseAuth.instance;

  Position? position = await Geolocator.getLastKnownPosition();


  DateTime now = new DateTime.now();
  DateTime date = new DateTime(now.year, now.month, now.day);

  final CollectionReference<Map<String, dynamic>> usersRef =
  FirebaseFirestore.instance.collection('Fuel');
  usersRef
      .add({
    'Uid' : auth.currentUser?.uid,
    'Date': date,
    'type' : 'Petrol 91',
    'status' : '0',
    'longitude':position?.longitude,
    'latitude':position?.latitude,
    'cost': cost,

  })
      .then((value) => print("Fuel Request Added"))
      .catchError((error) => print("Failed to add Fuel Request: $error"));
}
