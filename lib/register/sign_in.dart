import 'package:flutter/material.dart';
import 'package:restarauntexamapp/firebase/authentification_helper.dart';
import 'package:restarauntexamapp/homepage/zoom_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 35),
              child: TextFormField(
                validator: (s) {
                  if (s!.length < 6) {
                    return "Eng kamida 6 ta belgi yozilsin!!!";
                  }
                },
                controller: _emailController,
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
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 35),
              child: TextFormField(
                controller: _passwordController,
                validator: (s) {
                  if (s!.length < 5) {
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
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 60),
                  primary: Colors.orange.shade800,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();

                  await AuthServicesHelper().signInWithEmail(
                    _emailController.text,
                    _passwordController.text,
                  );
                  await Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Zooom()),
                      (route) => true);
                }
              },
              child: Text(
                "Login",
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
}
