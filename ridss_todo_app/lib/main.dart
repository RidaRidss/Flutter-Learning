import 'package:flutter/material.dart';
import './todoScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(
              title: new Center(
                  child: new Text('Todo App', textAlign: TextAlign.center)),
              backgroundColor: Colors.black54),
          body: new TodoScreen()),
    );
  }
}
