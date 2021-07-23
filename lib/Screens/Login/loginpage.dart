import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  // const Loginpage({Key key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool hidePassword = true;
  TextEditingController _usernameController = TextEditingController();

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFFF44336), Color(0xFF4CAF50)],
  ).createShader(Rect.fromLTWH(130.0, 200.0, 125.0, 200.0));

  late String _email;
  late String _password;
  var errorMessage;

  // final _auth = FirebaseAuth.instance;
  late BuildContext ctx;

  Future<void> _createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      // userSetup(_usernameController.text);
    } on FirebaseAuthException catch (e) {
      var message = 'An error occurred, please check your credentials!';
      if (e.message != null) {
        message = e.message!;
        setState(() {
          errorMessage = message;
        });
        print("Message");
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
      setState(() {
        errorMessage = e.toString();
      });
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      // userSetup(_usernameController.text);
    } on FirebaseAuthException catch (e) {
      var message = 'An error occurred, please check your credentials!';
      if (e.message != null) {
        message = e.message!;
        setState(() {
          errorMessage = message;
        });
        print("Message");
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
      setState(() {
        errorMessage = e.toString();
      });
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        centerTitle: true,
        title:
            Text("LUDIS", style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: _usernameController,
                onChanged: (value) {
                  _email = value;
                },
                enableSuggestions: false,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.mail),
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              obscureText: hidePassword,
              onChanged: (value) {
                _password = value;
              },
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
                prefixIcon: Icon(Icons.vpn_key),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: _login,
                  child: Text("Login"),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.blue)))),
                    onPressed: _createUser,
                    child: Text("Sign Up"),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
