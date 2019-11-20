import 'package:flutter/material.dart';
import 'package:flutter_rest_api_sample/api_service.dart';
import './posts.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool _isLoading = false;
  static String userId = '';

  TextEditingController _usernameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ridss Sample For Flutter with Api Integration'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                      decoration: InputDecoration(hintText: 'username'),
                      controller: _usernameController),
                  Container(height: 20),
                  _isLoading
                      ? CircularProgressIndicator()
                      : SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                              color: Colors.blue,
                              child: Text('Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                              onPressed: () async {
                                this.setState(() => {_isLoading: true});
                                final users = await ApiService.getUserList();
                                this.setState(() => {_isLoading: false});
                                if (users == null) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'check your internet connection'),
                                            actions: <Widget>[
                                              FlatButton(
                                                  child: Text('OK'),
                                                  onPressed: () =>
                                                      Navigator.pop(context))
                                            ]);
                                      });
                                  return;
                                } else {
                                  final user = users
                                      .where((u) =>
                                          u['username'] ==
                                          _usernameController.text)
                                      .first;
                                  final userWithUserNameExists = user != null;
                                  if (userWithUserNameExists) {
                                    userId = user['id'].toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Posts()));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                              title: Text('Incorrect Username'),
                                              content: Text(
                                                  'Try with a different username'),
                                              actions: <Widget>[
                                                FlatButton(
                                                    child: Text('OK'),
                                                    onPressed: () =>
                                                        Navigator.pop(context))
                                              ]);
                                        });
                                  }
                                }
                              }))
                ]))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
