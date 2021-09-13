import 'package:flutter/material.dart';
import 'package:restarauntexamapp/cartitemalari/cartschema.dart';
import 'package:restarauntexamapp/size_config.dart';

class NoOrdersWidget extends StatelessWidget {
  const NoOrdersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: getProportionScreenWidth(180.0),
              height: getProportionScreenHeight(190.0),
              child: ImageIcon(
                AssetImage('assets/images/shopping_car.png'),
                color: Color(0xFFC7C7C7),
              ),
            ),
            SizedBox(height: getProportionScreenHeight(28.0)),
            Text(
              "No orders yet",
              style: TextStyle(
                fontSize: getProportionScreenWidth(28.0),
              ),
            ),
            SizedBox(height: getProportionScreenHeight(28.0)),
            Text(
              "Hit the orange button down\nbelow to Create an order",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getProportionScreenWidth(20.0),
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: getProportionScreenHeight(40.0),
          child: Container(
            width: getProportionScreenWidth(314.0),
            height: getProportionScreenHeight(70.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CartSchema()));
              },
              child: Text(
                "Start ordering",
                style: TextStyle(
                  fontSize: getProportionScreenWidth(17.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
