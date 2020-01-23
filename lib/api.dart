import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"]);
  }
}

Future<List<Post>> fetchPosts() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    Iterable postsJson = json.decode(response.body);
    return postsJson.map((model) => Post.fromJson(model)).toList();
  } else {
    throw Exception("Failed to load posts");
  }
}
