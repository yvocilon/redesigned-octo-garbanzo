import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api.dart';

class Book extends StatefulWidget {
  @override
  _BookState createState() {
    return _BookState();
  }
}

class _BookState extends State<Book> {
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.all(25),
        child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text(
                        snapshot.data.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )),
                  Text(snapshot.data.body),
                ]);
              }

              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CupertinoActivityIndicator();
            }));
  }
}
