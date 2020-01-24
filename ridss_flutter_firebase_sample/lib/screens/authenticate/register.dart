import 'package:flutter/material.dart';
import 'package:ridss_flutter_firebase_sample/services/auth.dart';
import 'package:ridss_flutter_firebase_sample/shared/constants.dart';

class Register extends StatefulWidget {
  // this statefull widget will receive a method toggleView from its parent class , definition is written below
  final Function toggleView;
// registry is written below for the above method for this class

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        elevation: 0.0,
        title: Text('Register To FlutterFire'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Sign In',
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
          // add the variable in key property of form , so that we can validate the field values inside the form
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                  // add some field decoration
                  decoration: textInputDecoration.copyWith(hintText: 'EMAIL'),
                  // add the validator property for this form field
                  validator: (val) => val.isEmpty ? 'ENTER AN EMAIL' : null,
                  // set screen state for email here
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              SizedBox(height: 20.0),
              TextFormField(
                  // add some field decoration
                  decoration:
                      textInputDecoration.copyWith(hintText: 'PASSWORD'),
                  // add the validator property for this form field
                  validator: (val) => val.length > 6
                      ? 'ENTER PASSWORD 6 CHARACTERS LONG'
                      : null,
                  // this "obcureText" proverty is used to hide the writing letters in text field
                  obscureText: true,
                  // set screen state for password here
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  // here we are validating the form fields on press
                  if (_formKey.currentState.validate()) {
                    print(email);
                    print(password);
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
            ],
          ),
        ),
      ),
    );
  }
}
