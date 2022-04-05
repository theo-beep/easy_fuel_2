import 'package:easy_fuel_2/ColorConstants.dart';
import 'package:easy_fuel_2/UserInterface/order_history_page.dart';
import 'package:easy_fuel_2/UserInterface/request_fuel.dart';
import 'package:flutter/material.dart';

class CategoryWidget2 extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const CategoryWidget2({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  OrderHistory()),
      );
    },
    child:  Container(
      height: 150,
      width: 380,
      child: Card(
        color: secondColor,
        child: Row(
          children: [
            Expanded(
              flex: 33,
              child:  Container(
                  child: Icon(Icons.history,
                    size: 80,
                    color: kBlueColor,
                  )
              ),
            ),
            Expanded(
              flex: 66,
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                        child: Text(
                            'History',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25,
                              color: kBlueColor,
                            )
                        )),
                  ),
                  Icon(Icons.chevron_right_rounded,
                      size: 50,
                      color: kBlueColor
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
