import 'package:complainz/model/post.dart';

class PostViewModel {
  late Post _post;

  setPost(Post post) {
    _post = post;
  }

  Post get post => _post;
}
