// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Home/homepage.dart';
import 'package:flutter_firebase_login/Screens/Register/RegisterScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_login/widgets/custom_alert_dialog.dart';
import 'package:flutter_firebase_login/components/AuthHelper.dart';

class Login extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final emailField = TextFormField(
      key: new Key("EmailField"),
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "example@domain.com",
        labelText: "Email",
        prefixIcon: Icon(Icons.mail),
        filled: true,
        fillColor: Color.fromRGBO(223, 248, 250, 1),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Please enter your Email Address';
        }
        // Check if the entered email has the right format
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter a valid Email Address';
        }
        // Return null if the entered email is valid
        return null;
      },
    );

    void showAlertDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController _emailControllerField =
            TextEditingController();
            return CustomAlertDialog(
              content: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 4.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Text("Insert Reset Email:"),
                    Padding(padding: EdgeInsets.all(10)),
                    emailField,
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.red,
                        // color: Color(0xff8c52ff),
                        child: MaterialButton(
                          minWidth: mq.size.width / 2,
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          child: Text(
                            "Send Reset Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async {
                            try {
                              FirebaseAuth.instance.sendPasswordResetEmail(
                                  email: _emailControllerField.text);
                              Navigator.of(context).pop();
                            } catch (e) {
                              print(e);
                              // Add snackbar reporting error
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

    final logo = Image.asset(
      "assets/images/ludisLogo.png",
      height: mq.size.height / 4,
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          key: new Key("PasswordField"),
          obscureText: hidePassword,
          controller: _passwordController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: "password",
            filled: true,
            prefixIcon: Icon(Icons.vpn_key),
            suffixIcon: IconButton(
              icon:
              Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
            ),
            fillColor: Color.fromRGBO(223, 248, 250, 1),
            // Make changes to color here
            labelText: "Password",
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
          validator: (value) {
            if (value.trim().isEmpty) {
              return 'Please enter you Password';
            }

            if (value.trim().length < 8) {
              return 'Password must be at least 8 characters in length';
            }

            // Return null if the entered password is valid
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
                child: Text(
                  "Forgot Password",
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.black),
                ),
                onPressed: () {
                  showAlertDialog(context);
                }),
          ],
        ),
      ],
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          emailField,
          SizedBox(
            height: 10,
          ),
          passwordField,
        ],
      ),
    );

    _showAlertDialog(errorMsg) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Login Failed',
                style: TextStyle(color: Colors.black),
              ),
              content: Text(errorMsg),
            );
          }
      );
    }

    final loginButton = Container(
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
                ]
            )
        ),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: MaterialButton(
            key: new Key("LoginButton"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
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
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                try {
                  await Firebase.initializeApp();
                  UserCredential user =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                  // prefs.setString('displayName', user.user.displayName);
                  // Navigator.of(context).pushNamed(AppRoutes.home);
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Homepage()));
                } on FirebaseAuthException catch (e) {
                  _showAlertDialog(AuthExceptionHandler.generateExceptionMessage(AuthExceptionHandler.handleException(e)));
                }
              }
            },
          ),
        ));

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Not a member?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.black,
              ),
            ),
            MaterialButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(AppRoutes.authRegister);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );

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
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Container(
              height: mq.size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  logo,
                  fields,
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}