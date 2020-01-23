import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(),
        child: SafeArea(
            minimum: EdgeInsets.all(25),
            child: Column(children: <Widget>[Text(post.body)])));
  }
}
