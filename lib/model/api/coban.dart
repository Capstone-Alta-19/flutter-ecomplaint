// import 'dart:convert';

// import 'package:complainz/model/GetComplaintCategoryModel.dart';
// import 'package:dio/dio.dart';

// import '../../config/app_url.dart';

// Dio dio = Dio();

// Future getComplaintCategory() async {
//   try {
//     var response = await dio.get("http://178.128.210.192:8080/complaintz/complaint/category/1?sort=desc",
//         // queryParameters: {
//         //   "sort": "desc",
//         // },
//         options: Options(headers: {
//           'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJyb2xlIjoiVVNFUiIsInVzZXJJZCI6MX0.sKjg0jYpSn0NcsCR5cSrLmdfr5fxnKsuGq5zD9TxpZc',
//           'Content-type': 'application/json; charset=UTF-8',
//         }));
//     GetComplaintCategoryModel complaintCategory = GetComplaintCategoryModel.fromJson(response.data);
//     final List<dynamic> Json = jsonDecode(response.data);
//     if (response.statusCode == 200) {
//       return json;
//     }
//     throw "Error";
//   } on DioException catch (e) {
//     throw "error";
//   }
// }

import 'package:dio/dio.dart';

import '../GetComplaintCategoryModel.dart';

class GetComplaintCategoryApi {
  final Dio _dio;

  GetComplaintCategoryApi(this._dio);

  Future<GetComplaintCategoryModel> getComplaints() async {
    try {
      Response response = await _dio.get('https://api.example.com/complaints');
      if (response.statusCode == 200) {
        return GetComplaintCategoryModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch complaints');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  // You can add more methods for other CRUD operations here
}
