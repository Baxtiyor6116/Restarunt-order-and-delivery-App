import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:restarauntexamapp/homepage/homepage.dart';
import 'package:restarauntexamapp/homepage/zoom_in_screen_page.dart';
import 'package:restarauntexamapp/size_config.dart';

class Zooom extends StatefulWidget {
  @override
  _ZooomState createState() => _ZooomState();
}

class _ZooomState extends State<Zooom> {
  final _drawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ZoomDrawer(
        clipMainScreen: true,
        mainScreenScale: 0.40,
        controller: _drawerController,
        menuScreen: MenuScreenDrawer(),
        mainScreen: HomePage(
          _drawerController,
        ),
        borderRadius: 24.0,
        showShadow: true,
        angle: -20,
        backgroundColor: Colors.grey.shade300,
        slideWidth: MediaQuery.of(context).size.width * .5,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}
