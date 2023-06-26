import 'dart:convert';

GetComplaintCategoryModel getComplaintCategoryModelFromJson(String str) => GetComplaintCategoryModel.fromJson(json.decode(str));

String getComplaintCategoryModelToJson(GetComplaintCategoryModel data) => json.encode(data.toJson());

class GetComplaintCategoryModel {
  int id;
  String? photoProfile;
  String fullName;
  String username;
  String category;
  String description;
  String? photoUrl;
  String? videoUrl;
  bool isPublic;
  String? feedback;
  int likesCount;
  String createdAt;

  GetComplaintCategoryModel({
    required this.id,
    this.photoProfile,
    required this.fullName,
    required this.username,
    required this.category,
    required this.description,
    this.photoUrl,
    this.videoUrl,
    required this.isPublic,
    this.feedback,
    required this.likesCount,
    required this.createdAt,
  });

  factory GetComplaintCategoryModel.fromJson(Map<String, dynamic> json) => GetComplaintCategoryModel(
        id: json["id"],
        photoProfile: json["photo_profile"],
        fullName: json["full_name"],
        username: json["username"],
        category: json["category"],
        description: json["description"],
        photoUrl: json["photo_url"],
        videoUrl: json["video_url"],
        isPublic: json["is_public"],
        feedback: json["feedback"],
        likesCount: json["likes_count"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo_profile": photoProfile,
        "full_name": fullName,
        "username": username,
        "category": category,
        "description": description,
        "photo_url": photoUrl,
        "video_url": videoUrl,
        "is_public": isPublic,
        "feedback": feedback,
        "likes_count": likesCount,
        "created_at": createdAt,
      };
}
