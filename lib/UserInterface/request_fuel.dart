
import 'package:easy_fuel_2/FirebaseFirestore/add_user_to_firestore.dart';
import 'package:easy_fuel_2/Widgets/number_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_fuel_2/Widgets/textfield_widget.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../ColorConstants.dart';

void main() => runApp(const RequestFuel());

class RequestFuel extends StatelessWidget {
  const RequestFuel({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            title: const Text(_title),
            backgroundColor: primaryColor,
        ),
        body: const MyStatefulWidget(),
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
    final ButtonStyle style =
    ElevatedButton.styleFrom(
        primary: primaryColor,
        textStyle: const TextStyle(fontSize: 20));

    bool isSwitched = false;

    //final prefs = await SharedPreferences.getInstance();

    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 30),
          const SizedBox(height: 24),
          const SizedBox(height: 20),
          TextFieldWidget(
              label: "Email",
              text:" " ,
              onChanged: (email) {}),
          const SizedBox(height: 20),
          TextFieldWidget(
              label: "Amount",
              text: " ",
              onChanged: (name) {}),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
            },
            child: const Text('Enabled'),
          ),
        ],
      ),
    );
  }


}
