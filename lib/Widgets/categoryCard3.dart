import 'package:easy_fuel_2/ColorConstants.dart';
import 'package:easy_fuel_2/UserInterface/order_history_page.dart';
import 'package:easy_fuel_2/UserInterface/request_fuel.dart';
import 'package:flutter/material.dart';

import '../UserInterface/progress_page.dart';

class CategoryWidget3 extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const CategoryWidget3({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      splashColor: Colors.blue.withAlpha(30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  deliveryProgress()),
        );
        debugPrint('Card tapped.');
      },
      child: const SizedBox(
        width: 300,
        height: 100,
        child: Text('View Progress'),
      ),
    ),
  );
}
