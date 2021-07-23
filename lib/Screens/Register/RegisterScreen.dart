// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_login/Screens/Home/homepage.dart';
import 'package:flutter_firebase_login/Screens/Login2/LoginScreen.dart';
import 'package:flutter_firebase_login/net/firebase.dart';

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
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        // hintText: "Hardik Narang",
        labelText: "Username",
        prefixIcon: Icon(Icons.verified_user),
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
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "something@example.com",
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
        labelText: "Password",
        prefixIcon: Icon(Icons.vpn_key),
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
        labelText: "Re-enter Password",
        prefixIcon: Icon(Icons.vpn_key),
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
        if (value.isEmpty) {
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
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "e0634578",
        prefixIcon: Icon(Icons.perm_identity_sharp),
        filled: true,
        fillColor: Color.fromRGBO(223, 248, 250, 1),
        labelText: "NUSNET ID",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          usernameField,
          SizedBox(
            height: 5,
          ),
          emailField,
          SizedBox(
            height: 5,
          ),
          passwordField,
          SizedBox(
            height: 5,
          ),
          repasswordField,
          SizedBox(
            height: 5,
          ),
          nusnetIdField,
        ],
      ),
    );

    final registerButton = Container(
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
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
          color: Colors.transparent,
          shadowColor: Colors.transparent,
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
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                try {
                  await Firebase.initializeApp();
                  UserCredential user = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  User updateUser = FirebaseAuth.instance.currentUser;
                  // CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
                  // DocumentSnapshot snapshot = await userRef.doc(updateUser.uid).get();
                  // var userModel = UserModel.fromJson(snapshot.data());
                  // context.read<userInformation>().state = userModel;
                  // updateUser.updateDisplayName(_usernameController.text);
                  userSetup(context, _usernameController.text,
                      _nusnetIdController.text, _emailController.text);
                  // Navigator.of(context).pushNamed(AppRoutes.home);
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Homepage()));
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
        ));

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
                    color: Colors.black,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                // Navigator.of(context).pushNamed(AppRoutes.authLogin);
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Login",
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
          ])),
      child: Scaffold(
        // backgroundColor: Color(0xff8c52ff),
        // backgroundColor: Colors.orangeAccent,
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
      ),
    );
  }
}
