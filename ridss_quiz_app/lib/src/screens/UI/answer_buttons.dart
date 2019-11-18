import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool answer;
  final VoidCallback _onTap;
  AnswerButton(this.answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Material(
      color:Colors.white,
      child: new InkWell(
        onTap: () => this._onTap(),
        child: new Center(
          child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.deepPurple, width: 5.0)),
              padding: new EdgeInsets.all(20.0),
              child: new Text(answer == true ? 'true' : 'false',
                  style: new TextStyle(
                      color: Colors.deepPurple,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0))),
        ),
      ),
    ));
  }
}
