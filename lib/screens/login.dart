import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:poolfrontend/screens/mainpage.dart';
import 'package:poolfrontend/widgets/googlefacebooksignin.dart';
import 'package:poolfrontend/widgets/signinbutton.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoggedIn = false;
  final _formKey = GlobalKey<FormState>();

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: _isLoggedIn
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back,",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(children: <Widget>[
                            TextField(
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
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              style: TextStyle(color: Colors.black),
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
                            )
                          ]),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          child: SignInButton("Log In", () {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(100, 50, 100, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    BrandIcons.google,
                                    color: Colors.white,
                                  ),
                                  onPressed: _login,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red[400],
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  icon: Icon(
                                    BrandIcons.facebook,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              ));
  }
}
