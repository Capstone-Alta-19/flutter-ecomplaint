import 'dart:convert';
import 'package:complainz/model/post.dart';
import 'package:complainz/notifiers/post_notifier.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiEndpoint =
      "https://api.postman.com/collections/26517696-8cda4f51-6d5e-42ba-959f-94ec8624a36a?access_key=PMAT-01H142C5AME7BSR58D82667K7V";

  static getPosts(PostNotifier postNotifier) async {
    List<Post> postList = [];
    http.get(Uri.parse(apiEndpoint)).then((response) {
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      }

      List posts = jsonDecode(response.body);
      posts.forEach((element) {
        postList.add(Post.fromMap(element));
      });

      //print(postList.length);
      postNotifier.setPostList(postList);
    });
  }

  static Future<bool> addPost(Post post, PostNotifier postNotifier) async {
    print("addPost");
    bool result = false;
    await http
        .post(Uri.parse(apiEndpoint),
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: jsonEncode(post.toMap()))
        .then((response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        print("succesfull");
        result = true;
        postNotifier.addPostToList(post);
      }
    });

    return result;
  }
}
