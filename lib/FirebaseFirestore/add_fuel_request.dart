import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fuel_2/Models/add_fuel_request.dart';
import 'package:easy_fuel_2/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

void createUser(addFuelRequest f) async {
  // Obtain shared preferences.
  //final prefs = await SharedPreferences.getInstance();
  //final String? email = prefs.getString('userEmail');
  FirebaseAuth auth = FirebaseAuth.instance;

  final CollectionReference<Map<String, dynamic>> usersRef =
  FirebaseFirestore.instance.collection('Fuel').doc(auth.currentUser?.uid).collection('FuelRequests');
  usersRef
      .add({
    'Date': f.dateOfRequest,
    'longitude':f.longitude,
    'latitude': f.latitude,
    'cost': f.cost,

  })
      .then((value) => print("Fuel Request Added"))
      .catchError((error) => print("Failed to add Fuel Request: $error"));
}
