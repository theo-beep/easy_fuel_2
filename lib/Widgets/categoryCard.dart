import 'package:easy_fuel_2/ColorConstants.dart';
import 'package:easy_fuel_2/UserInterface/request_fuel.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const CategoryWidget({
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
          MaterialPageRoute(builder: (context) => const RequestFuel()),
        );
        debugPrint('Card tapped.');
      },
      child: const SizedBox(
        width: 300,
        height: 100,
        child: Text('Order Fuel'),
      ),
    ),
  );
}
