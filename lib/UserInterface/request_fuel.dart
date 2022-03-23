
import 'dart:ffi';

import 'package:easy_fuel_2/FirebaseFirestore/add_user_to_firestore.dart';
import 'package:easy_fuel_2/Utils/geoLocationUtil.dart';
import 'package:easy_fuel_2/Widgets/number_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_fuel_2/Widgets/textfield_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ColorConstants.dart';
import '../FirebaseFirestore/add_fuel_request.dart';

void main() => runApp(const RequestFuel());

class RequestFuel extends StatelessWidget {
  const RequestFuel({Key? key}) : super(key: key);

  static const String _title = 'Buy Fuel';



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

    String dropdownValue = 'Petrol 91';

    bool isSwitched = false;


    final costController = TextEditingController();
    //final prefs = await SharedPreferences.getInstance();

    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 30),
          const SizedBox(height: 24),
          const SizedBox(height: 20),
          const Text(
            'Select type of Fuel',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Petrol 91','Petrol 93', 'Petrol 95', 'Diesel 500ppm', 'Diesel 50ppm']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
        const Text(
          'Price ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextField(
          controller: costController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              fuelRequest(double.parse(costController.text));
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
