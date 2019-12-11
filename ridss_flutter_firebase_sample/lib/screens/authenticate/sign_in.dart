import 'package:flutter/material.dart';
import 'package:ridss_flutter_firebase_sample/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Ridss Flutter Firebase Sample'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text('Sign in Anonym'),
          onPressed: () async {
            dynamic result = await _auth.signInAnoyn();
            if (result == null) {
              print('error while sign in');
            } else {
              print('signed in');
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
