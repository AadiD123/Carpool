import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final _text;
  final _onpressedfunction;

  SignInButton(this._text, this._onpressedfunction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 35,
      child: ElevatedButton(
        onPressed: _onpressedfunction,
        child: Text(_text),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
