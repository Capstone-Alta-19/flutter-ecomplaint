import 'dart:convert';

GetAllNewsModel getAllNewsModelFromJson(String str) => GetAllNewsModel.fromJson(json.decode(str));

String getAllNewsModelToJson(GetAllNewsModel data) => json.encode(data.toJson());

class GetAllNewsModel {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String? deletedAt;
  String newsName;
  String photoUrl;
  String description;
  int categoryId;
  int adminId;

  GetAllNewsModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.newsName,
    required this.photoUrl,
    required this.description,
    required this.categoryId,
    required this.adminId,
  });

  factory GetAllNewsModel.fromJson(Map<String, dynamic> json) => GetAllNewsModel(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        newsName: json["news_name"],
        photoUrl: json["photo_url"],
        description: json["description"],
        categoryId: json["category_id"],
        adminId: json["admin_id"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "news_name": newsName,
        "photo_url": photoUrl,
        "description": description,
        "category_id": categoryId,
        "admin_id": adminId,
      };
}
