import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restarauntexamapp/Orders/order_complete.dart';
import 'package:restarauntexamapp/size_config.dart';
import 'package:restarauntexamapp/widgets/custom_app_bar.dart';
import 'package:restarauntexamapp/widgets/schema_for_variable.dart';

enum SingingCharacter { delivery, payment }

class CheckOutPayment extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPayment> {
  SingingCharacter? _character = SingingCharacter.delivery;

  var selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedIndex = 0;
  }

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
                    height: getProportionScreenHeight(41),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionScreenWidth(50),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionScreenWidth(32),
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
                                "Payment method",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionScreenWidth(20),
                              vertical: getProportionScreenHeight(20)),
                          width: getProportionScreenWidth(348),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Color(0xFFFA4A0C),
                                    value: 1,
                                    groupValue: selectedIndex,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedIndex = val;
                                      });
                                    },
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    height: getProportionScreenHeight(40),
                                    width: getProportionScreenWidth(40),
                                    child: ImageIcon(
                                      AssetImage(
                                        "assets/icons/card.png",
                                      ),
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF47B0A),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: getProportionScreenWidth(11),
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
                                        "Card",
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
                                  Radio(
                                    activeColor: Color(0xFFFA4A0C),
                                    value: 2,
                                    groupValue: selectedIndex,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedIndex = value;
                                      });
                                    },
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    height: getProportionScreenHeight(40),
                                    width: getProportionScreenWidth(40),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFEB4796),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ImageIcon(
                                      AssetImage(
                                        "assets/icons/mobile.png",
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionScreenWidth(11),
                                  ),
                                  Text(
                                    "Mobile Money \n(MTN,VODA)",
                                    style: TextStyle(
                                        fontSize: getProportionScreenWidth(17)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: getProportionScreenHeight(76)),
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialogWidget();
                        });
                  },
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

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: getProportionScreenHeight(322),
          width: getProportionScreenWidth(315),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: getProportionScreenHeight(17),
                    left: getProportionScreenWidth(46),
                    bottom: getProportionScreenHeight(19)),
                decoration: BoxDecoration(
                    color: Color(0xFFEDEDED),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Text(
                  "Please note",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: getProportionScreenHeight(18),
                    left: getProportionScreenWidth(46),
                    bottom: getProportionScreenHeight(19),
                    right: getProportionScreenWidth(50)),
                width: getProportionScreenWidth(322),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Delivery to trasaco",
                        style: GoogleFonts.actor(
                            fontSize: getProportionScreenWidth(18),
                            color: Colors.black.withOpacity(0.5))),
                    Text("GHS 2 - GH 3 ",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: getProportionScreenWidth(18))),
                    SizedBox(height: getProportionScreenHeight(17)),
                    Divider(
                      thickness: 0.3,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(height: getProportionScreenHeight(17)),
                    Text("Delivery to campus",
                        style: GoogleFonts.actor(
                            fontSize: getProportionScreenWidth(18),
                            color: Colors.black.withOpacity(0.5))),
                    Text("GHS 2 - GH 3 ",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: getProportionScreenWidth(18))),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 17, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  Container(
                    height: getProportionScreenHeight(60),
                    width: getProportionScreenWidth(159),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFA4A0C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          if (Variables.cartList.isNotEmpty) {
                            final _order = await FirebaseFirestore.instance
                                .collection('order_collection')
                                .add({
                              "date": DateTime.now(),
                              "orderrs":
                                  FieldValue.arrayUnion(Variables.cartList),
                              "total": Variables.total,
                              "process": false,
                            });

                            Future.delayed(Duration(seconds: 10), () {
                              FirebaseFirestore.instance
                                  .collection('order_collection')
                                  .doc(_order.id)
                                  .update({
                                "process": true,
                              });
                            });

                            for (String id in Variables.cartList) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(Variables.authUser.currentUser!.uid)
                                  .update({
                                'cart_items': FieldValue.arrayRemove([id]),
                              });

                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(Variables.authUser.currentUser!.uid)
                                  .update({
                                'order_items':
                                    FieldValue.arrayUnion([_order.id]),
                              });
                            }
                            Variables.cartList.clear();
                            Variables.total = 0;
                          }

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OrderComplete(),
                            ),
                            ModalRoute.withName('/'),
                          );
                        },
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
