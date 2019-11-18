import '../screens/landing_page.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.deepPurple,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('Your Score!',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          new Text(score.toString() + "/" + totalQuestions.toString(),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          new IconButton(
              icon: new Icon(Icons.arrow_right),
              iconSize: 50.0,
              color: Colors.white,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new LandingPage()),
                  (Route route) => route == null))
        ],
      ),
    );
  }
}
