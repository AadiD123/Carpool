import 'package:flutter/material.dart';
import 'package:poolfrontend/config/palette.dart';
import 'package:poolfrontend/screens/home.dart';
import 'package:poolfrontend/screens/mainpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pool App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Palette.background,
        accentColor: Palette.red,
      ),
      home: Home(),
    );
  }
}
