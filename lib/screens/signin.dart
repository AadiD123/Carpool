//To be further implemented

import 'package:flutter/material.dart';
import 'package:poolfrontend/services/auth.dart';
import 'package:poolfrontend/widgets/googlefacebooksignin.dart';
import 'package:poolfrontend/widgets/signinbutton.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            (Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'Enter an password 6+ chars long'
                          : null,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            (Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SignInButton("Sign In", () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            error = "Could not sign in with those credentials";
                            loading = false;
                          });
                        }
                      }
                    }),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            GoogleFaceBookSignIn(),
          ],
        ),
      ),
    );
  }
}
