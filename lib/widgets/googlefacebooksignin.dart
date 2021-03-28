import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';

class GoogleFaceBookSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: IconButton(
            icon: Icon(
              BrandIcons.google,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red[400],
          ),
        ),
        SizedBox(
          width: 15,
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
    );
  }
}
