// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('Hello World'),),
               ElevatedButton(
                // style: ,
                onPressed: () {
                  var currentUser = FirebaseAuth.instance.currentUser;
                  if (currentUser != null) {
                    print(currentUser.uid);
                  }
                },
                child: const Text('Disabled'),
              ),
          ],
        ),
      ),
    );
  }
}