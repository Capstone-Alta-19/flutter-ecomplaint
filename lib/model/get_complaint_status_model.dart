import 'dart:convert';

GetComplaintStatus getComplaintStatusFromJson(String str) => GetComplaintStatus.fromJson(json.decode(str));

String getComplaintStatusToJson(GetComplaintStatus data) => json.encode(data.toJson());

class GetComplaintStatus {
  int id;
  String description;
  String status;

  GetComplaintStatus({
    required this.id,
    required this.description,
    required this.status,
  });

  factory GetComplaintStatus.fromJson(Map<String, dynamic> json) => GetComplaintStatus(
        id: json["id"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "status": status,
      };
}
