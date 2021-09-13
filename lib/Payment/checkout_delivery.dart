import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restarauntexamapp/size_config.dart';
import 'package:restarauntexamapp/widgets/custom_app_bar.dart';

enum SingingCharacter { delivery, payment }

class CheckOutDelivery extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutDelivery> {
  SingingCharacter? _character = SingingCharacter.delivery;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              // padding: EdgeInsets.only(
              //   bottom: 30,
              // ),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  CustomAppBar(
                    title: "Checkout",
                    action: false,
                  ),
                  SizedBox(
                    height: getProportionScreenHeight(35),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionScreenWidth(50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(45),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Adress details",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "change",
                                style: TextStyle(
                                  color: Color(0xFFFA4A0C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(20),
                        ),
                        Container(
                          width: getProportionScreenWidth(315),
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionScreenWidth(25),
                              vertical: getProportionScreenHeight(30)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Thelma Sara-bear ",
                                  style: GoogleFonts.actor(
                                      fontSize: getProportionScreenWidth(18))),
                              Divider(
                                thickness: 1,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Text("Trasaco hotel, behind navrongo campus",
                                  style: GoogleFonts.actor(
                                      fontSize: getProportionScreenWidth(13))),
                              SizedBox(
                                height: getProportionScreenHeight(28),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              SizedBox(
                                height: getProportionScreenHeight(8),
                              ),
                              Text(
                                "+233 5413 8989 ",
                                style: GoogleFonts.actor(
                                    fontSize: getProportionScreenWidth(15)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionScreenHeight(42),
                        ),
                        Container(
                          width: size.width - 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery method.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionScreenWidth(15),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(20)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionScreenWidth(20),
                              vertical: getProportionScreenHeight(20)),
                          width: getProportionScreenWidth(315),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio<SingingCharacter>(
                                    activeColor: Color(0xFFFA4A0C),
                                    value: SingingCharacter.delivery,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? a) {
                                      setState(() {
                                        _character = a;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              getProportionScreenHeight(25)),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  width: 1))),
                                      child: Text(
                                        "Door delivery",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionScreenWidth(17)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<SingingCharacter>(
                                    activeColor: Color(0xFFFA4A0C),
                                    value: SingingCharacter.payment,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter? a) {
                                      setState(() {
                                        _character = a;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Pick up",
                                    style: TextStyle(
                                        fontSize: getProportionScreenWidth(17)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(50)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: GoogleFonts.actor(
                                    fontSize: getProportionScreenWidth(17))),
                            Text("23,000",
                                style: GoogleFonts.actor(
                                    fontSize: getProportionScreenWidth(22))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionScreenHeight(150),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                height: getProportionScreenHeight(70.0),
                width: getProportionScreenWidth(315),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFA4A0C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Process to payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionScreenWidth(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
