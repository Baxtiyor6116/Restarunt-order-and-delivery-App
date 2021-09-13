import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restarauntexamapp/homepage/homepage.dart';
import 'package:restarauntexamapp/firebase/authentification_helper.dart';
import 'package:restarauntexamapp/homepage/zoom_page.dart';
import 'package:restarauntexamapp/widgets/schema_for_variable.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _phoneController = TextEditingController();
  var _emailController = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  var _passwordController = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30),
              child: TextFormField(
                controller: _emailController,
                validator: (s) {
                  if (s!.length < 6) {
                    return "Eng kamida 6 ta belgi yozilsin!!!";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email Addressni kiriting..",
                    focusColor: Colors.black,
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.4))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30),
              child: TextFormField(
                controller: _passwordController,
                validator: (s) {
                  if (s!.length < 6) {
                    return "Eng kamida 4 ta belgi yozilsin!!!";
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Passwordni kiriting...",
                    focusColor: Colors.black,
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.4))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30),
              child: TextFormField(
                controller: _namecontroller,
                validator: (s) {
                  if (s!.length < 5) {
                    return "Eng kamida 4 ta belgi yozilsin!!!";
                  }
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Enter your name ...",
                    focusColor: Colors.black,
                    labelText: "Name ...",
                    labelStyle: TextStyle(
                        fontSize: 15, color: Colors.black.withOpacity(0.4))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 30, top: 20),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot passcode? ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange.shade800,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 60),
                  primary: Colors.orange.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: _emailSignUp,
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _emailSignUp() async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential _credential = await Variables.authUser
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

        _credential.user!.updateDisplayName(_namecontroller.text);

        FirebaseFirestore.instance
            .collection('users')
            .doc(_credential.user!.uid)
            .set(
          {
            "email": _emailController.text,
            "name": _namecontroller.text,
            "password": _passwordController.text,
            "cart_items": FieldValue.arrayUnion([]),
            "order_items": FieldValue.arrayUnion([]),
            "favorite_items": FieldValue.arrayUnion([]),
          },
        );

        if (Variables.authUser.currentUser != null) {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Zooom()));
        }
      } catch (e) {
        print("XATO: " + e.toString());
      }
    }
  }
}
