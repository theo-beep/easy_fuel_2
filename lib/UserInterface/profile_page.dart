
import 'package:easy_fuel_2/FirebaseFirestore/add_user_to_firestore.dart';
import 'package:easy_fuel_2/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_fuel_2/Widgets/profile_widget.dart';
import 'package:easy_fuel_2/Widgets/textfield_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const UserProfile());

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);


  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    bool isSwitched = false;

    //final prefs = await SharedPreferences.getInstance();

    String path="https://lite-images-i.scdn.co/image/ab67616d0000b27301830dd8d2e45189fe8e0451";
    String name = "theolin";
    String email="theolin57@gmail.com";
    String cell = "0747407856";
    bool delivery = false;



    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 30),
          ProfileWidget(imagePath: path,
              onClicked: (){}),
          const SizedBox(height: 24),
          TextFieldWidget(
              label: "username",
              text: name,
              onChanged: (names) {
                name = names;
              }),
          const SizedBox(height: 20),
          TextFieldWidget(
              label: "Email",
              text: email,
              onChanged: (email) {}),
          const SizedBox(height: 20),
          TextFieldWidget(
              label: "Cellphone",
              text: cell,
              onChanged: (name) {}),
          const SizedBox(height: 30),
          Switch(
          value: delivery,
          onChanged: (value) {
          setState((){
            delivery = value;
          });}),

          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
             myUser u =  myUser (
                  imagePath: path,
                  name: name,
                  email: email,
                  cellphone: cell,
                  delivery: delivery,
                  isDarkMode: false);
                  //createUser2(u);
                createUser(u);
            },
            child: const Text('Enabled'),
          ),
        ],
      ),
    );
  }

}
