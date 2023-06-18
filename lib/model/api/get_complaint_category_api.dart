// import 'package:complainz/model/GetComplaintCategoryModel.dart';
// import 'package:dio/dio.dart';

// import '../../config/app_url.dart';

// class GetComplaintCategoryApi {
//   Dio dio = Dio();

//   Future getComplaintCategory() async {
//     var response = await dio.get("${AppUrl.getComplaintCategory}/1",
//         queryParameters: {
//           "sort": "desc",
//         },
//         options: Options(headers: {
//           'Content-type': 'application/json; charset=UTF-8',
//         }));
//     GetComplaintCategoryModel complaintCategory = getComplaintCategoryModelFromJson(response.data);
//     if (response.statusCode == 200) {
//       return complaintCategory.complaints;
//     } else {
//       complaintCategory.message;
//     }
//     return complaintCategory.message;
//   }
// }

import 'dart:math';

import 'package:complainz/model/GetComplaintCategoryModel.dart';
import 'package:dio/dio.dart';

import '../../config/app_url.dart';

class GetComplaintCategoryApi {
  Dio dio = Dio();

  Future<List<GetComplaintCategoryModel>> getComplaintCategory() async {
    try {
      var response = await dio.get("http://178.128.210.192:8080/complaintz/complaint/category/1?sort=desc",
          // queryParameters: {
          //   "sort": "desc",
          // },
          options: Options(headers: {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJyb2xlIjoiVVNFUiIsInVzZXJJZCI6MX0.sKjg0jYpSn0NcsCR5cSrLmdfr5fxnKsuGq5zD9TxpZc',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        List<GetComplaintCategoryModel> complaint = List<GetComplaintCategoryModel>.from(response.data["complaints"].map((e) => GetComplaintCategoryModel.fromJson(e))).toList();
        // GetComplaintCategoryModel complaintCategory = getComplaintCategoryModelFromJson(response.data);
        // List<GetComplaintCategoryModel> complaintCategory = List<GetComplaintCategoryModel>.from(response.data['complaintCategory'].map(e)) => GetComplaintCategoryModel.fromJson(model);
        print(complaint);
        return complaint;
      } else
        throw "Error";
    } on DioException catch (e) {
      throw "Error";
    }
  }
}
