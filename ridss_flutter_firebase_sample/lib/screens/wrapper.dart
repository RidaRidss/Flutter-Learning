import 'package:flutter/material.dart';
import 'package:ridss_flutter_firebase_sample/screens/authenticate/authenticate.dart';
import 'package:ridss_flutter_firebase_sample/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:ridss_flutter_firebase_sample/models/user.dart';

class Wrapper extends StatelessWidget {
  @override

  // here we need a context , because this wrapper will get User signin value / signout no value -- on behalf of this we do something

  Widget build(BuildContext context) {
   
    // here we are using "provider package to get the data" and the syntax "<User> is telling what kind of data will be receive" here , "in (context) we will receive the data"

    final user = Provider.of<User>(context);

    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
