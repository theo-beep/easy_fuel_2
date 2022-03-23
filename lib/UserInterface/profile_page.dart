import 'package:easy_fuel_2/ColorConstants.dart';
import 'package:easy_fuel_2/FirebaseFirestore/add_user_to_firestore.dart';
import 'package:easy_fuel_2/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_fuel_2/Widgets/profile_widget.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const UserProfile());

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  static const String _title = 'Profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: primaryColor,
        ),
        body:
        const MyStatefulWidget(),
      ),
      debugShowCheckedModeBanner: false,
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
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: primaryColor,
      textStyle: const TextStyle(fontSize: 20),
    );

    bool isSwitched = false;

    //final prefs = await SharedPreferences.getInstance();

    String path =
        "https://lite-images-i.scdn.co/image/ab67616d0000b27301830dd8d2e45189fe8e0451";
    String name = "theolin";
    String email = "theolin57@gmail.com";
    String cell = "0747407856";
    bool delivery = false;

    const snackBar = SnackBar(
      content: Text('Changes are saved '),
    );


    String label = "name";

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final cellPhoneController = TextEditingController();

    nameController.text = name;
    emailController.text = email;
    cellPhoneController.text = cell;


    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 30),
          ProfileWidget(imagePath: path, onClicked: () {}),
          const SizedBox(height: 24),
          const SizedBox(height: 8),

          const Text(
            'Username',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'cell',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextField(
            controller: cellPhoneController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Deilvery',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          FlutterSwitch(
            width: 120.0,
            height: 48.0,
            valueFontSize: 25.0,
            toggleSize: 45.0,
            value: false,
            borderRadius: 30.0,
            padding: 8.0,
            showOnOff: false,
            onToggle: (val) {
              setState(() {

              });
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              myUser u = myUser(
                  imagePath: path,
                  name: nameController.text.toString(),
                  email: emailController.text.toString(),
                  cellphone: cellPhoneController.text.toString(),
                  delivery: delivery,
                  isDarkMode: false);
              createUser(u);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Save Changes '),
          ),
        ],
      ),
    );
  }
}
