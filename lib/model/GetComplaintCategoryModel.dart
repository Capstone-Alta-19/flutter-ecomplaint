// To parse this JSON data, do
//
//     final getComplaintCategoryModel = getComplaintCategoryModelFromJson(jsonString);

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

// class GetComplaintCategoryModel {
//   List<Complaints>? complaints;
//   String? message;

//   GetComplaintCategoryModel({this.complaints, this.message});

//   GetComplaintCategoryModel.fromJson(Map<String, dynamic> json) {
//     if (json['complaints'] != null) {
//       complaints = <Complaints>[];
//       json['complaints'].forEach((v) {
//         complaints!.add(new Complaints.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.complaints != null) {
//       data['complaints'] = this.complaints!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

// class Complaints {
//   int? id;
//   Null? photoProfile;
//   String? fullName;
//   String? username;
//   String? category;
//   String? description;
//   Null? photoUrl;
//   Null? videoUrl;
//   bool? isPublic;
//   Null? feedback;
//   int? likesCount;
//   String? createdAt;

//   Complaints({this.id, this.photoProfile, this.fullName, this.username, this.category, this.description, this.photoUrl, this.videoUrl, this.isPublic, this.feedback, this.likesCount, this.createdAt});

//   Complaints.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     photoProfile = json['photo_profile'];
//     fullName = json['full_name'];
//     username = json['username'];
//     category = json['category'];
//     description = json['description'];
//     photoUrl = json['photo_url'];
//     videoUrl = json['video_url'];
//     isPublic = json['is_public'];
//     feedback = json['feedback'];
//     likesCount = json['likes_count'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['photo_profile'] = this.photoProfile;
//     data['full_name'] = this.fullName;
//     data['username'] = this.username;
//     data['category'] = this.category;
//     data['description'] = this.description;
//     data['photo_url'] = this.photoUrl;
//     data['video_url'] = this.videoUrl;
//     data['is_public'] = this.isPublic;
//     data['feedback'] = this.feedback;
//     data['likes_count'] = this.likesCount;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }
