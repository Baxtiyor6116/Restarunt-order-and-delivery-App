import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restarauntexamapp/homepage/startPage.dart';
import 'package:restarauntexamapp/homepage/zoom_page.dart';
import 'package:restarauntexamapp/login/login_page.dart';
import 'package:restarauntexamapp/widgets/schema_for_variable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        textTheme: GoogleFonts.actorTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}
