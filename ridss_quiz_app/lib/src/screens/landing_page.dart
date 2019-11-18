import './quiz_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.deepPurple,
        child: new InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new QuizPage())),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Quiz",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
                new Text("Tap to start",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic)),
                    new Text("prepared by: Rida Sarwar Bilgrami",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))
              ],
            )));
  }
}
