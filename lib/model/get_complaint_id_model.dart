import 'dart:convert';

GetComplaintIdModel getComplaintIdModelFromJson(String str) => GetComplaintIdModel.fromJson(json.decode(str));

String getComplaintIdModelToJson(GetComplaintIdModel data) => json.encode(data.toJson());

class GetComplaintIdModel {
  int id;
  String? photoProfile;
  String fullName;
  String username;
  String description;
  String? photoUrl;
  dynamic videoUrl;
  bool isPublic;
  String? feedback;
  String createdAt;
  List<Comment> comments;
  String? userProfile;

  GetComplaintIdModel({
    required this.id,
    this.photoProfile,
    required this.fullName,
    required this.username,
    required this.description,
    this.photoUrl,
    this.videoUrl,
    required this.isPublic,
    this.feedback,
    required this.createdAt,
    required this.comments,
    this.userProfile,
  });

  factory GetComplaintIdModel.fromJson(Map<String, dynamic> json) => GetComplaintIdModel(
        id: json["id"],
        photoProfile: json["photo_profile"],
        fullName: json["full_name"],
        username: json["username"],
        description: json["description"],
        photoUrl: json["photo_url"],
        videoUrl: json["video_url"],
        isPublic: json["is_public"],
        feedback: json["feedback"],
        createdAt: json["created_at"],
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        userProfile: json["user_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo_profile": photoProfile,
        "full_name": fullName,
        "username": username,
        "description": description,
        "photo_url": photoUrl,
        "video_url": videoUrl,
        "is_public": isPublic,
        "feedback": feedback,
        "created_at": createdAt,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "user_profile": userProfile,
      };
}

class Comment {
  int id;
  dynamic photoProfile;
  String fullName;
  String username;
  String description;
  String createdAt;

  Comment({
    required this.id,
    this.photoProfile,
    required this.fullName,
    required this.username,
    required this.description,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        photoProfile: json["photo_profile"],
        fullName: json["full_name"],
        username: json["username"],
        description: json["description"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo_profile": photoProfile,
        "full_name": fullName,
        "username": username,
        "description": description,
        "created_at": createdAt,
      };
}
