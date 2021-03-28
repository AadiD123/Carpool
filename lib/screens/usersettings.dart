import 'package:flutter/material.dart';
import 'package:poolfrontend/screens/mainpage.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListView(),
    );
  }
}

Widget getListView() {
  var listView = ListView(
    children: [
      ListTile(
        title: Text("Edit Profile"),
        onTap: () {},
      ),
      ListTile(
        title: Text("Sign up to be a driver"),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MainPage()),
          // );
        },
      ),
    ],
  );
  return listView;
}
