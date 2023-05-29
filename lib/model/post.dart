class Post {
  //int? id;
  String? username;
  String? email;
  String? phone;
  String? password;
  Post();
  Post.fromMap(Map<String, dynamic> data) {
    //id = data['id'];
    username = data['username'];
    email = data['email'];
    phone = data['phone'];
    password = data['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      //'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
} 


/* 
class Post {
  int? id;
  int? userId;
  String? body;
  String? title;
  Post();
  Post.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    userId = data['userId'];
    body = data['body'];
    title = data['title'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'body': body,
      'title': title,
    };
  }
} */
