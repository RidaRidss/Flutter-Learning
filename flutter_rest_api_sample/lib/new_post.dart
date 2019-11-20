import 'package:flutter/material.dart';
import './api_service.dart';

import 'posts.dart';

class NewPost extends StatefulWidget {
  @override
  NewPostState createState() => NewPostState();
}

class NewPostState extends State<NewPost> {
  final _TitleController = new TextEditingController();
  final _BodyController = new TextEditingController();
  
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New Post'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _TitleController,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
                TextField(
                  controller: _BodyController,
                  decoration: InputDecoration(hintText: 'Body'),
                ),
                Container(height: 50),
                !_isLoading
                    ? RaisedButton(
                        padding: const EdgeInsets.only(top: 10),
                        color: Colors.blue,
                        child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Text(
                            'Submit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        onPressed: () => {
                              if (_TitleController.text.isEmpty ||
                                  _BodyController.text.isEmpty)
                                {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                              title: Text('Failure'),
                                              content: Text(
                                                  'you need to to fill all of the fields.'),
                                              actions: <Widget>[
                                                FlatButton(
                                                    child: Text('OK'),
                                                    onPressed: () =>
                                                        Navigator.pop(context))
                                              ]))
                                }
                              else
                                {
                                  ApiService.addPost({
                                    'title': _TitleController.text,
                                    'body': _BodyController.text,
                                    'userId': '1'
                                  }).then((success) {
                                    String title, text;
                                    if (success) {
                                      title = 'Success';
                                      text =
                                          'your post has been submitted successfully';
                                    } else {
                                      title = 'Error';
                                      text =
                                          'An error occurred while posting your post';
                                    }
                                    return showDialog(
                                        context: context,
                                        builder:
                                            (context) => AlertDialog(
                                                    title: Text(title),
                                                    content: Text(text),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                          child: Text('OK'),
                                                          onPressed: () => {
                                                                Navigator.of(context).pushAndRemoveUntil(
                                                                    new MaterialPageRoute(
                                                                        builder:
                                                                            (BuildContext context) =>
                                                                                new Posts()),
                                                                    (Route route) =>
                                                                        route ==
                                                                        null)

                                                                // Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder:
                                                                //             (context) =>
                                                                //                 Posts()))
                                                              })
                                                    ]));
                                  })
                                }
                            })
                    : Container()
              ],
            )));
  }
}
