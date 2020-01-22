import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridss_flutter_firebase_sample/screens/wrapper.dart';
import 'package:ridss_flutter_firebase_sample/services/auth.dart';
import 'package:ridss_flutter_firebase_sample/models/user.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper()
        )
      );
  }
}
