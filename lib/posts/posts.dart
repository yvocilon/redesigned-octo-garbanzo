import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';

import 'detail.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() {
    return _PostsState();
  }
}

class _PostsState extends State<Posts> {
  Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text("Posts")),
        child: Scaffold(body: _futureBuilder()));
  }

  FutureBuilder _futureBuilder() {
    return FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) {
                                return new PostDetail(
                                  post: snapshot.data[index],
                                );
                              },
                              title: "${snapshot.data[index].title}"),
                        );
                      },
                      title: Text("${snapshot.data[index].title}"));
                });
          }

          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CupertinoActivityIndicator();
        });
  }
}
