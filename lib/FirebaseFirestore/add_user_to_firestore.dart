import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fuel_2/Models/user_model.dart';
import 'package:easy_fuel_2/UserInterface/profile_page.dart';

void createUser(User loggedInUser) {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users
      .add({
    'username': loggedInUser.name, // John Doe
    'email':  loggedInUser.email, // Stokes and Sons
    'Cellphone':  loggedInUser.phone, // 42
    'delivery':loggedInUser.delivery
  })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));

}