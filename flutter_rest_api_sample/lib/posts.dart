import 'package:flutter/material.dart';
import './api_service.dart';
import './Post_detail.dart';
import './new_post.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewPost())),
      ),
      appBar: AppBar(
          title: Text('Posts',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal)),
          backgroundColor: Colors.blue),
      body: FutureBuilder(
          future: ApiService.getPostList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final posts = snapshot.data;
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(height: 2, color: Colors.black);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(posts[index]['title'],
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(posts[index]['body']),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PostDetail(posts[index]['id']))));
                  },
                  itemCount: posts.length);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
