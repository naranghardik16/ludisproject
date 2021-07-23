// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_login/Screens/Home/homepage.dart';
import 'package:flutter_firebase_login/Screens/Login2/LoginScreen.dart';
import 'package:flutter_firebase_login/model/user_model.dart';
import 'package:flutter_firebase_login/net/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/state/state_management.dart';
import 'package:flutter_firebase_login/theme/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _nusnetIdController = TextEditingController();

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      print('Everything looks good!');
      print(_emailController);
      print(_usernameController);
      print(_passwordController);
      print(_rePasswordController);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/images/ludisLogo.png",
      height: mq.size.height / 4,
    );

    final usernameField = TextFormField(
      controller: _usernameController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        // hintText: "Hardik Narang",
        labelText: "Username",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'This field is required';
        }
        if (value.trim().length < 4) {
          return 'Username must be at least 4 characters in length';
        }
        // Return null if the entered username is valid
        return null;
      },
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "something@example.com",
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Please enter your email address';
        }
        // Check if the entered email has the right format
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        // Return null if the entered email is valid
        return null;
      },
    );

    final passwordField = TextFormField(
      obscureText: true,
      controller: _passwordController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "password",
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'This field is required';
        }
        if (value.trim().length < 8) {
          return 'Password must be at least 8 characters in length';
        }
        // Return null if the entered password is valid
        return null;
      },
    );

    final repasswordField = TextFormField(
      obscureText: true,
      controller: _rePasswordController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "password",
        labelText: "Re-enter Password",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      validator: (value) {
        if(value.isEmpty){
          return 'This field is required';
        }

        if (value != _passwordController.text) {
          return 'Confirmation password does not match the entered password';
        }
        return null;
      },
    );

    final nusnetIdField = TextFormField(
      controller: _nusnetIdController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "e0634578",
        labelText: "NUSNET ID",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          usernameField,
          emailField,
          passwordField,
          repasswordField,
          nusnetIdField,
        ],
      ),
    );

    final registerButton = Material(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
      color: Color.fromRGBO(237, 148, 99, 1),
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () async {
          if(_formKey.currentState.validate()) {
            try {
              await Firebase.initializeApp();
              UserCredential user =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              );
              User updateUser = FirebaseAuth.instance.currentUser;
              // CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
              // DocumentSnapshot snapshot = await userRef.doc(updateUser.uid).get();
              // var userModel = UserModel.fromJson(snapshot.data());
              // context.read<userInformation>().state = userModel;
              // updateUser.updateDisplayName(_usernameController.text);
              userSetup(context, _usernameController.text, _nusnetIdController.text, _emailController.text);
              // Navigator.of(context).pushNamed(AppRoutes.home);
              Navigator.push(context, new MaterialPageRoute(builder: (context) => Homepage()));
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e.toString());
            }

          }
          // _trySubmitForm();
          // try {
          //   await Firebase.initializeApp();
          //   UserCredential user =
          //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //     email: _emailController.text,
          //     password: _passwordController.text,
          //   );
          //   User updateUser = FirebaseAuth.instance.currentUser;
          //   // updateUser.updateDisplayName(_usernameController.text);
          //   userSetup(_usernameController.text, _nusnetIdController.text);
          //   // Navigator.of(context).pushNamed(AppRoutes.home);
          //   Navigator.push(context, new MaterialPageRoute(builder: (context) => Homepage()));
          // } on FirebaseAuthException catch (e) {
          //   if (e.code == 'weak-password') {
          //     print('The password provided is too weak.');
          //   } else if (e.code == 'email-already-in-use') {
          //     print('The account already exists for that email.');
          //   }
          // } catch (e) {
          //   print(e.toString());
          // }
        },
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        registerButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Already have an account?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.white,
              ),
            ),
            MaterialButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(AppRoutes.authLogin);
                Navigator.push(context, new MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Login",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      // backgroundColor: Color(0xff8c52ff),
      // backgroundColor: Colors.orangeAccent,
      backgroundColor: Color.fromRGBO(95, 106, 228, 1),
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
                const SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}