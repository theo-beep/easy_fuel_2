import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fuel_2/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';


void createUser(myUser u) async {

  // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  FirebaseAuth auth = FirebaseAuth.instance;
  var uid = auth.currentUser?.uid.toString();

  final String? email = prefs.getString('userEmail');
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

  usersRef
      .add(
      {
          'imagePath':u.imagePath,
          'username': u.name,
          'email': u.email,
          'cellphone': u.cellphone,
          'delivery': u.delivery,
          'darkMode' : u.isDarkMode
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}
