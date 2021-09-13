import 'package:flutter/material.dart';

class OrderComplete extends StatefulWidget {
  const OrderComplete({Key? key}) : super(key: key);

  @override
  _MyoffersState createState() => _MyoffersState();
}

class _MyoffersState extends State<OrderComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Order Complete",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 34,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 113,
                  width: 113,
                  child: Image.asset(
                    "assets/images/shopping_car.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Thank you for Ordering ",
                style: TextStyle(fontSize: 26),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Center(
                  child: Container(
                    width: 233,
                    height: 57,
                    child: Column(
                      children: [
                        Text(
                          "Your devliery will be in",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade500),
                        ),
                        Text(
                          "soon.",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
