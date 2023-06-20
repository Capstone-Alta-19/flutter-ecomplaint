import 'package:complainz/model/GetComplaintCategoryModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';

class GetComplaintCategoryApi {
  Dio dio = Dio();

  Future<List<GetComplaintCategoryModel>> getComplaintCategory({required String category, required String sort}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.get("${AppUrl.baseUrl}/complaintz/complaint/category/$category",
          queryParameters: {
            "sort": sort,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJyb2xlIjoiVVNFUiIsInVzZXJJZCI6MX0.sKjg0jYpSn0NcsCR5cSrLmdfr5fxnKsuGq5zD9TxpZc
      if (response.statusCode == 200) {
        List<GetComplaintCategoryModel> complaint = List<GetComplaintCategoryModel>.from(response.data["complaints"].map((e) => GetComplaintCategoryModel.fromJson(e))).toList();
        // GetComplaintCategoryModel complaintCategory = getComplaintCategoryModelFromJson(response.data);
        // List<GetComplaintCategoryModel> complaintCategory = List<GetComplaintCategoryModel>.from(response.data['complaintCategory'].map(e)) => GetComplaintCategoryModel.fromJson(model);
        print(complaint);
        return complaint;
      } else {
        throw "Error";
      }
    } on DioException {
      throw "Error";
    }
  }
}
