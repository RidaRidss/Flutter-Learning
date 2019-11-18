import 'package:flutter/material.dart';
import 'dart:math' as math;

class CorrectWrongOverlay extends StatefulWidget {
  final bool isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this.isCorrect, this._onTap);
  @override
  State createState() => new CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose(){
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(color: Colors.white, width: 5.0),
              ),
              child: new Transform.rotate(
                  angle: _iconAnimation.value * 2 * math.pi,
                  child: new Icon(widget.isCorrect ? Icons.done : Icons.clear,
                      size: _iconAnimation.value * 80.0, color: Colors.white)),
            ),
            new Padding(
              padding: new EdgeInsets.only(bottom: 20.0),
            ),
            new Text(widget.isCorrect ? 'Correct!' : 'Wrong!',
                style: TextStyle(fontSize: 30, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
