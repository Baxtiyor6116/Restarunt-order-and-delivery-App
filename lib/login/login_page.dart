import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restarauntexamapp/homepage/homepage.dart';
import 'package:restarauntexamapp/register/sign_in.dart';
import 'package:restarauntexamapp/register/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  TabController? _tabController;

  var _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  width: 414,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                Positioned(
                  top: 64,
                  left: 110,
                  child: Container(
                    height: 162,
                    width: 131,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/bella.png",
                          ),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    height: 100,
                    width: 360,
                    child: TabBar(
                      indicatorWeight: 3,
                      indicatorColor: Colors.orange.shade600,
                      indicatorPadding: EdgeInsets.all(20),
                      controller: _tabController,
                      tabs: [
                        Text(
                          "Login",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
           
            Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SignInPage(),
                    SignUp(),
                  ],
                
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
