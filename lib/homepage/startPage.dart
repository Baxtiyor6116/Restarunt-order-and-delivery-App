import 'package:flutter/material.dart';
import 'package:restarauntexamapp/homepage/zoom_page.dart';
import 'package:restarauntexamapp/login/login_page.dart';
import 'package:restarauntexamapp/widgets/schema_for_variable.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.redAccent,
          ),
          Positioned(
            top: 40,
            left: 46,
            child: CircleAvatar(
              radius: 34,
              backgroundColor: Colors.white,
              child: Container(
                height: 49,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/bella.png",
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 46,
            right: 80,
            child: Container(
              width: 278.7,
              height: 120.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "CALEB G",
                        style: TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Restaraunt",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 330.34,
            left: 90,
            child: Container(
              height: 298.36,
              width: 330.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/toyFaces_1.png"),
                      fit: BoxFit.fitHeight)),
            ),
          ),
          Positioned(
            top: 270.34,
            left: -100,
            child: Container(
              height: 360.36,
              width: 450.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/toyFaces_2.png"),
                      fit: BoxFit.contain)),
            ),
          ),
          Positioned(
            top: 500,
            left: -74,
            child: Container(
              width: 600,
              height: 195,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.red,
                Colors.redAccent,
                Colors.transparent,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            ),
          ),
          Positioned(
            top: 600,
            left: 25,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              height: 70,
              width: 314,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Variables.authUser.currentUser != null
                                  ? Zooom()
                                  : LoginPage()));
                },
                child: Text(
                  "Get started",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
