import 'dart:io';

import 'package:enhance_stepper/enhance_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';



void main() {
  runApp(deliveryProgress());
}

class deliveryProgress extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int groupValue = 0;

  StepperType _type = StepperType.horizontal;

  List<Tuple2> tuples = [
    Tuple2(
      Icons.directions_bike,
      StepState.indexed,
    ),
    Tuple2(
      Icons.directions_bus,
      StepState.editing,
    ),
    Tuple2(
      Icons.directions_railway,
      StepState.complete,
    ),
    Tuple2(Icons.directions_boat, StepState.disabled, ),
    // Tuple2(Icons.directions_car, StepState.error, ),
  ];

  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  buildStepperCustom(context),
      // body: buildStepperCustom(context),
    );
  }

  PreferredSizeWidget buildPreferredSize(BuildContext context) {
    return PreferredSize(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 24),
              SizedBox(width: 24)
            ],
          ),
        ),
        preferredSize: Size(double.infinity, 48));
  }

  void go(int index) {
    if (index == -1 && _index <= 0) {
      return;
    }

    if (index == 1 && _index >= tuples.length - 1) {

      return;
    }

    setState(() {
      _index += index;
    });
  }

  Widget buildStepperCustom(BuildContext context) {
    return EnhanceStepper(
      // stepIconSize: 60,
        type: _type,
        horizontalTitlePosition: HorizontalTitlePosition.bottom,
        horizontalLinePosition: HorizontalLinePosition.top,
        currentStep: _index,
        physics: ClampingScrollPhysics(),
        steps: tuples
            .map((e) => EnhanceStep(
          // icon: Icon(
          //   e.item1,
          //   // Icons.add,
          //   color: Colors.blue,
          //   size: 60,
          // ),
          state: StepState.values[tuples.indexOf(e)],
          isActive: _index == tuples.indexOf(e),
          title: Text("step ${tuples.indexOf(e)}"),
          subtitle: Text(
            "${e.item2.toString().split(".").last}",
          ),
          content: Text("Content for Step ${tuples.indexOf(e)}"),
        ))
            .toList(),
        onStepCancel: () {
          go(-1);
        },
        onStepContinue: () {
          go(1);
        },
        onStepTapped: (index) {
          setState(() {
            _index = index;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: [
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: Text("Next"),
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: Text("Back"),
              ),
            ],
          );
        });
  }
}