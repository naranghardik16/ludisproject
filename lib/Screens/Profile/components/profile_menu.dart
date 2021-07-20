// import 'dart:html';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../constants.dart';
typedef VoidCallback = void Function();

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          // primary: Color(0xFFF5F6F9),
          primary: Colors.black,
          backgroundColor: Color.fromRGBO(253, 204, 213, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.black),
          )
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              icon,
              // color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15), )),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}