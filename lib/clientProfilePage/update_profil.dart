import 'package:flutter/material.dart';
import 'package:restarauntexamapp/clientProfilePage/ClientProfile.dart';
import 'package:restarauntexamapp/size_config.dart';
import 'package:restarauntexamapp/widgets/custom_app_bar.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  int? selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height / 866;
    var w = size.width / 411;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    CustomAppBar(
                      title: "My Profile",
                      action: false,
                    ),
                    SizedBox(
                      height: getProportionScreenHeight(55),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Information",
                            style: TextStyle(
                                fontSize: getProportionScreenWidth(17),
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: getProportionScreenHeight(20),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16 * w, vertical: 16 * h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: getProportionScreenWidth(60),
                                  height: getProportionScreenWidth(60),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/profile.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionScreenWidth(15),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Thelma Sara-bear",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionScreenWidth(18)),
                                      ),
                                      SizedBox(
                                        height: getProportionScreenHeight(8),
                                      ),
                                      Text(
                                        "thelma_sara-bear@gmail.com",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize:
                                                getProportionScreenWidth(13)),
                                      ),
                                      SizedBox(
                                          height: getProportionScreenHeight(9)),
                                      Text(
                                        "Trasaco hotel,behind navrongo campus",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontSize:
                                                getProportionScreenWidth(13)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            height: getProportionScreenHeight(133),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.03),
                                  offset: Offset(1, 1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: getProportionScreenHeight(48)),
                          Text(
                            "Payment method",
                            style: TextStyle(
                                fontSize: getProportionScreenWidth(17),
                                color: Colors.black),
                          ),
                          SizedBox(height: getProportionScreenHeight(21)),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionScreenWidth(25),
                                vertical: getProportionScreenHeight(20)),
                            width: getProportionScreenWidth(315),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.03),
                                  offset: Offset(1, 1),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 1;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        activeColor: Color(0xFFF47B0A),
                                        value: 1,
                                        groupValue: selectedIndex,
                                        onChanged: (val) {
                                          setState(() {
                                            selectedIndex = val as int?;
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
                                                  getProportionScreenHeight(
                                                      25)),
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
                                                    getProportionScreenWidth(
                                                        17)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 2;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        activeColor: Color(0xFFEB4796),
                                        value: 2,
                                        groupValue: selectedIndex,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedIndex = value as int?;
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
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  getProportionScreenHeight(
                                                      25)),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black
                                                          .withOpacity(0.3),
                                                      width: 1))),
                                          child: Text(
                                            "Mobile Money (MTN,VODA)",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionScreenWidth(
                                                        17)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 3;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Radio(
                                        activeColor: Color(0xFF0038FF),
                                        value: 3,
                                        groupValue: selectedIndex,
                                        onChanged: (val) {
                                          setState(() {
                                            selectedIndex = val as int?;
                                          });
                                        },
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        height: getProportionScreenHeight(40),
                                        width: getProportionScreenWidth(40),
                                        child: ImageIcon(
                                          AssetImage(
                                            "assets/icons/ppicon.png",
                                          ),
                                          color: Colors.white,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF0038FF),
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
                                                  getProportionScreenHeight(
                                                      25)),
                                          child: Text(
                                            "Pay on delivery",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionScreenWidth(
                                                        17)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionScreenHeight(162),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            child: Container(
              height: getProportionScreenHeight(70),
              width: getProportionScreenWidth(315),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    primary: Color(0xFFFA4A0C)),
                child: Text(
                  "Update Information",
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
