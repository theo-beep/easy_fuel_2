// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../Widgets/categoryCard.dart';
import '../Widgets/categoryCard2.dart';

void main() {
  runApp(const MainHomePage());
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body:       Container(
            child: Column(
              children: <Widget>[
                Container(),
                CategoryWidget(
                  text: 'dfg',
                  onClicked: () {
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                CategoryWidget2(
                  text: 'dfg',
                  onClicked: () {
                  },
                )

              ],
            )
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


