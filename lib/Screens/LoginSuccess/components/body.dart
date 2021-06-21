import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/components/default_button.dart';
import 'package:flutter_firebase_login/Screens/Home/homepage.dart';
import 'package:flutter_firebase_login/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)
                )
              )
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Text("Back to Home"),
          ),
        )
      ],


    );
    // return Column(
    //   children: [
    //     SizedBox(height: SizeConfig.screenHeight * 0.04),
    //     Image.asset(
    //       "assets/images/abc.png",
    //       height: SizeConfig.screenHeight * 0.4, //40%
    //     ),
    //     SizedBox(height: SizeConfig.screenHeight * 0.08),
    //     Text(
    //       "Login Success",
    //       style: TextStyle(
    //         fontSize: getProportionateScreenWidth(30),
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //     ),
    //     Spacer(),
    //     SizedBox(
    //       width: SizeConfig.screenWidth * 0.6,
    //       child: DefaultButton(
    //         text: "Back to home",
    //         press: () {
    //           Navigator.pushNamed(context, Homepage.routeName);
    //         },
    //       ),
    //     ),
    //     Spacer(),
    //   ],
    // );


    // return Container(
    //   child: Center(
    //     child: Text("Back to Home"),
    //   ),
    // );


  }
}