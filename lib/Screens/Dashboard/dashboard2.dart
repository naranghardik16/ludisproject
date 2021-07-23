import 'package:flutter/material.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)))),
        onPressed: () {
          // Navigator.pop(context);
        },
        child: Text("Profile"),
      )
          // child: Text("Profile"),
          ),
    );
  }
}
