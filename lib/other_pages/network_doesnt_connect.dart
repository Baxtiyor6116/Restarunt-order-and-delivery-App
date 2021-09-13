import 'package:flutter/material.dart';

class NetworkProblem extends StatelessWidget {
  const NetworkProblem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 122,
              width: 122,
              child: ImageIcon(
                AssetImage("assets/images/wifi_no_connect.png"),
                color: Color(0xFFC7C7C7),
              ),
            ),
            Text(
              "No internet Connection",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              " Your internet connection is currentlyn\n not available please check or try again. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFA4A0C),
                    fixedSize: Size(314, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(30))),
                onPressed: () {},
                child: Text(
                  "Try again",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
