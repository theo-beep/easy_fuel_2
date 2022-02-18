import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_fuel_2/Models/user_model.dart';
import 'package:easy_fuel_2/UserInterface/profile_page.dart';

void createUser(User u) {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  users
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
