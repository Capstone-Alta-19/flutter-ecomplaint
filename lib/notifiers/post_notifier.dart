import 'package:flutter/material.dart';
import 'package:complainz/model/post.dart';
import 'package:complainz/services/api_services.dart';

class PostNotifier with ChangeNotifier {
  List<Post> _postList = [];

  addPostToList(Post post) {
    _postList.add(post);
    notifyListeners();
  }

  setPostList(List<Post> postList) {
    _postList = [];
    _postList = postList;
    notifyListeners();
  }

  List<Post> getPostList() {
    return _postList;
  }

  Future<bool> uploadPost(Post post) async {
    return await ApiService.addPost(post, this);
  }
}
