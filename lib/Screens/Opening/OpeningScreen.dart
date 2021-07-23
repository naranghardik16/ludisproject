// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Login2/LoginScreen.dart';
import 'package:flutter_firebase_login/Screens/Register/RegisterScreen.dart';
// import 'package:bleyl_dev/theme/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OpeningView extends StatefulWidget {
  @override
  OpeningViewState createState() => OpeningViewState();
}

class OpeningViewState extends State<OpeningView> {
  OpeningViewState();

  String displayName = "";

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getString('displayName');
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/images/ludisLogo.png",
      height: mq.size.height / 4,
    );

    final loginButtonNew = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [
                0.2,
                0.4,
                0.6,
                0.8
              ],
              colors: [
                Color.fromRGBO(109, 216, 234, 1),
                Color.fromRGBO(105, 209, 233, 1),
                Color.fromRGBO(100, 189, 231, 1),
                Color.fromRGBO(98, 168, 231, 1),
              ])),
      child: Material(
        shadowColor: Colors.transparent,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.transparent,
        // color: Color.fromRGBO(109, 216, 234, 1),
        child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            // Navigator.of(context).pushNamed(AppRoutes.authLogin);
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
    );

    final registerButtonNew = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [
                0.2,
                0.4,
                0.6,
                0.8
              ],
              colors: [
                Color.fromRGBO(251, 236, 159, 1),
                Color.fromRGBO(251, 229, 119, 1),
                Color.fromRGBO(245, 214, 82, 1),
                Color.fromRGBO(235, 196, 48, 1),
              ])),
      child: Material(
        shadowColor: Colors.transparent,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.transparent,
        // color: Color.fromRGBO(109, 216, 234, 1),
        child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            // Navigator.of(context).pushNamed(AppRoutes.authLogin);
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Register()));
          },
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      // color: Color.fromRGBO(109, 216, 234, 1),
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          // Navigator.of(context).pushNamed(AppRoutes.authLogin);
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Login()));
        },
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      // color: Color.fromRGBO(251, 236, 1567, 0.8),
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          // Navigator.of(context).pushNamed(AppRoutes.authRegister);
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Register()));
        },
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButtonNew,
        Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 70),
          child: registerButtonNew,
        ),
      ],
    );

    display() {
      if (displayName != null)
        return Text(
          "Welcome back $displayName!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        );
      else
        return Text(
          "Welcome to Ludis!",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        );
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            0.15,
            0.30,
            0.40,
            0.7
          ],
              colors: [
            // Color.fromRGBO(100, 189, 231, 1),
            Color.fromRGBO(49, 124, 230, 1),
            Color.fromRGBO(105, 209, 233, 1),
            Color.fromRGBO(109, 216, 234, 1),
            Colors.white,
          ])),
      child: Scaffold(
        // backgroundColor: Color(0xff8c52ff),
        // backgroundColor: Colors.orangeAccent,
        // backgroundColor: Color.fromRGBO(95, 106, 228, 1),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: logo,
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: display(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: buttons,
              )
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   // backgroundColor: Color(0xff8c52ff),
    //   // backgroundColor: Colors.orangeAccent,
    //   backgroundColor: Color.fromRGBO(95, 106, 228, 1),
    //   body: SingleChildScrollView(
    //     padding: EdgeInsets.all(36),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Padding(
    //           padding: EdgeInsets.only(top: 50),
    //           child: logo,
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(top: 50, bottom: 50),
    //           child: display(),
    //         ),
    //         Padding(
    //           padding: EdgeInsets.only(top: 50, bottom: 50),
    //           child: buttons,
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
