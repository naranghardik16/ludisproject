import 'package:flutter/material.dart';
typedef VoidCallback = void Function();

class IconItemBox extends StatelessWidget {
  const IconItemBox({
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
            primary: Colors.black,
            backgroundColor: Colors.white,
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