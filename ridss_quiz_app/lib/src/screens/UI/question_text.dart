import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;
  QuestionText(this._question, this._questionNumber);
  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  // here we have used SingleTickerProviderStateMixin , it provides a single ticker
  Animation<double>
      _fontSizeAnimation; // its value may be 0,0.1,0.2 , .... so we are using its type double
  AnimationController
      _fontSizeAnimationController; // this will handle font size animation

  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  void initState() {
    // here is the method for initialization animation
    super.initState();
    _fontSizeAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
// vsync handles animations,
// we can choose animation in hours / minutes / seconds / milliseconds , here we are using milliseconds b/c we need animation faster
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.linear);
    _fontSizeAnimation.addListener(() {
      setState(() {});
    });
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose(){
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.deepPurple,
        child: new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Center(
                child: new Text(
                    "Statement " +
                        widget._questionNumber.toString() +
                        " : " +
                        widget._question,
                    style: new TextStyle(
                      color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: _fontSizeAnimation.value * 15)))));
  }
}
