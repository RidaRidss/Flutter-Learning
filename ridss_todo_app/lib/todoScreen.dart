import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen();

  @override
  State createState() => new TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black87,
      body: Column(),
      floatingActionButton:
          new FloatingActionButton(
            tooltip: 'Add Item',
            child: new ListTile(title : new Icon(Icons.add)),
            backgroundColor: Colors.redAccent,
            onPressed: _showFormDialog),
              );
            }
          
            void _showFormDialog() {
  }
}
