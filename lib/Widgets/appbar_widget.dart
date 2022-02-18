
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

AppBar buildAppBar(BuildContext context) {

  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: const BackButton(),
    backgroundColor: Colors.transparent,
    elevation:0,
    actions: [
      IconButton(
        onPressed: (){},
        icon: Icon(icon),
      )
    ],
  );
}