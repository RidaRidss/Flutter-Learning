import 'package:flutter/material.dart';
import 'package:ridss_flutter_firebase_sample/services/auth.dart';
import 'package:ridss_flutter_firebase_sample/shared/constants.dart';

class SignIn extends StatefulWidget {
  // this statefull widget will receive a method toggleView from its parent class , definition is written below

  final Function toggleView;

  // registry is written below for the above method for this class

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  // get the input forms key by value by initializing a variable "_formKey" for the form keys for this class

  final _formKey = GlobalKey<FormState>();

// textfield state

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[200],
        elevation: 4.0,
        title: Text('SignIn To FlutterFire'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  // add some decoration for this field
                  decoration: textInputDecoration.copyWith(hintText: 'EMAIL'),
                  // add the validator property for this form field
                  validator: (val) => val.isEmpty ? 'ENTER AN EMAIL' : null,
                  // set screen state for email here
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  // add some decoration for this field
                  decoration:
                      textInputDecoration.copyWith(hintText: 'PASSWORD'),
                  // this "obcureText" proverty is used to hide the writing letters in text field
                  obscureText: true,
                  // add the validator property for this form field
                  validator: (val) => val.length > 6
                      ? 'ENTER PASSWORD 6 CHARACTERS LONG'
                      : null,
                  // set screen state for password here
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text('Sign In', style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    // here we are validating the form fields on press
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                          await _auth.signInWithEmailNPassword(email, password);
                      if (result == null) {
                        setState(() => error =
                            'Could not sign in with those credentials.');
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
