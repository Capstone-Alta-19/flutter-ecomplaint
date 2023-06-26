import 'dart:convert';

GetNewsIdModel getNewsIdModelFromJson(String str) => GetNewsIdModel.fromJson(json.decode(str));

String getNewsIdModelToJson(GetNewsIdModel data) => json.encode(data.toJson());

class GetNewsIdModel {
  int id;
  String newsName;
  String photoUrl;
  String description;
  String admin;
  String category;
  String createdAt;
  List<GetNewsIdModelList> newsList;

  GetNewsIdModel({
    required this.id,
    required this.newsName,
    required this.photoUrl,
    required this.description,
    required this.admin,
    required this.category,
    required this.createdAt,
    required this.newsList,
  });

  factory GetNewsIdModel.fromJson(Map<String, dynamic> json) => GetNewsIdModel(
        id: json["id"],
        newsName: json["news_name"],
        photoUrl: json["photo_url"],
        description: json["description"],
        admin: json["admin"],
        category: json["category"],
        createdAt: json["created_at"],
        newsList: List<GetNewsIdModelList>.from(json["news_list"].map((x) => GetNewsIdModelList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "news_name": newsName,
        "photo_url": photoUrl,
        "description": description,
        "admin": admin,
        "category": category,
        "created_at": createdAt,
        "news_list": List<dynamic>.from(newsList.map((x) => x.toJson())),
      };
}

class GetNewsIdModelList {
  int id;
  String newsName;
  String photoUrl;

  GetNewsIdModelList({
    required this.id,
    required this.newsName,
    required this.photoUrl,
  });

  factory GetNewsIdModelList.fromJson(Map<String, dynamic> json) => GetNewsIdModelList(
        id: json["id"],
        newsName: json["news_name"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "news_name": newsName,
        "photo_url": photoUrl,
      };
}
