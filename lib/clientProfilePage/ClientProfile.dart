import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:restarauntexamapp/clientProfilePage/update_profil.dart';

class ClientProfilePage extends StatefulWidget {
  @override
  _ClientProfilePageState createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var h = size.height / 896;
    var w = size.width / 414;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 80 * h,
          bottom: 30 * h,
          left: 50 * w,
          right: 50 * w,
        ),
        child: Container(
          // color: Colors.green,
          width: size.width - 100 * w,
          height: size.height - 110 * h,
          child: Stack(
            children: [
              Positioned(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  color: Colors.black,
                  iconSize: 28 * h,
                ),
              ),
              Positioned(
                top: 50 * h,
                left: 15 * w,
                child: Text(
                  "My profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32 * h,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Positioned(
                top: 140 * h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10 * w),
                  width: size.width - 100 * w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal details",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15 * h,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "change",
                        style: TextStyle(
                          color: Color(0xFFFA4A0C),
                          fontSize: 14 * h,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170 * h,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16 * w, vertical: 16 * h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90 * w,
                        height: 100 * h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width - 106 * w - 32 * w - 90 * w,
                        // color: Colors.yellow,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  right: 5 * w, top: 5, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Thelma Sara-bear",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13 * h),
                                  ),
                                  Text(
                                    "thelma_sara-bear@gmail.com",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10 * h),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width -
                                  106 * w -
                                  32 * w -
                                  90 * w -
                                  30 * w,
                              margin: EdgeInsets.symmetric(horizontal: 15 * w),
                              padding: EdgeInsets.only(
                                  right: 5 * w, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "+233 54138989",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width -
                                  106 * w -
                                  32 * w -
                                  90 * w -
                                  30 * w,
                              margin: EdgeInsets.symmetric(horizontal: 15 * w),
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Trasaco hotel,behind navrongo campus",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13 * h),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: size.width - 106 * w,
                  margin: EdgeInsets.symmetric(horizontal: 3 * w),
                  height: 200 * h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1, 1),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              four("Orders", size.width, 400 * h, w, h),
              four("Pending reviews", size.width, 480 * h, w, h),
              four("Faq", size.width, 560 * h, w, h),
              four("Help", size.width, 640 * h, w, h),
              Positioned(
                  bottom: 1 * h,
                  child: Container(
                    width: size.width - 100 * w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFA4A0C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateProfile()));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20 * h, horizontal: 112 * w),
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15 * h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  four(String soz, double width, double top, double w, double h) {
    return Positioned(
      top: top,
      child: Container(
        width: width - 106 * w,
        margin: EdgeInsets.symmetric(horizontal: 3 * w),
        padding: EdgeInsets.symmetric(horizontal: 15 * w, vertical: 5 * h),
        height: 55 * h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade100,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              soz,
              style: TextStyle(fontSize: 17),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
