import 'package:flutter/material.dart';

class Myoffers extends StatefulWidget {
  const Myoffers({Key? key}) : super(key: key);

  @override
  _MyoffersState createState() => _MyoffersState();
}

class _MyoffersState extends State<Myoffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
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
              height: 30,
            ),
            Text(
              "My offers",
              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 34),
            ),
            SizedBox(
              height: 200,
            ),
            Text(
              "ohh snap! No offers yet",
              style: TextStyle(fontSize: 26),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 20),
              child: Text(
                "please check again.",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
