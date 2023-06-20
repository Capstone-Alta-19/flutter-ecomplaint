// // To parse this JSON data, do
// //
// //     final getComplaintStatus = getComplaintStatusFromJson(jsonString);

// import 'dart:convert';

// List<GetComplaintStatus> getComplaintStatusFromJson(String str) => List<GetComplaintStatus>.from(json.decode(str).map((x) => GetComplaintStatus.fromJson(x))).toList();

// String getComplaintStatusToJson(List<GetComplaintStatus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class GetComplaintStatus {
//   int id;
//   String description;
//   Status status;

//   GetComplaintStatus({
//     required this.id,
//     required this.description,
//     required this.status,
//   });

//   factory GetComplaintStatus.fromJson(Map<String, dynamic> json) => GetComplaintStatus(
//         id: json["id"],
//         description: json["description"],
//         status: statusValues.map[json["status"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "description": description,
//         "status": statusValues.reverse[status],
//       };
// }

// enum Status { PENDING, PROCCESS, RESOLVED }

// final statusValues = EnumValues({"Pending": Status.PENDING, "Proccess": Status.PROCCESS, "Resolved": Status.RESOLVED});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final getComplaintStatus = getComplaintStatusFromJson(jsonString);

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
