import 'package:flutter/material.dart';
import 'package:poolfrontend/screens/login.dart';
import 'package:poolfrontend/screens/mainpage.dart';
import 'package:poolfrontend/widgets/signinbutton.dart';
import 'package:poolfrontend/widgets/video.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoWidget(),
        Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: SignInButton(
                          "Sign In",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
