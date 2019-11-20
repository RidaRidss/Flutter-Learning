import 'package:flutter/material.dart';
import './api_service.dart';

class PostDetail extends StatelessWidget {
  final int _id;

  PostDetail(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Post Detail',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.normal))),
        body: Column(
          children: <Widget>[
            Container(
              height: 20,
            ),
            FutureBuilder(
              future: ApiService.getPostComments(_id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  final comments = snapshot.data;
                  return Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 2,
                              color: Colors.black,
                            );
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(comments[index]['name'],
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text(comments[index]['body']),
                            );
                          },
                          itemCount: comments.length));
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ));
  }
}
