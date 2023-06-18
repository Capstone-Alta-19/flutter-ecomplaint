import 'package:complainz/model/get_complaint_id_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';

class GetComplaintIdApi {
  Dio dio = Dio();

  Future<GetComplainIdModel> getComplaintId({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      await prefs.containsKey('token');
      var response = await dio.get("${AppUrl.baseUrl}/complaintz/complaint/$id",
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJyb2xlIjoiVVNFUiIsInVzZXJJZCI6MX0.sKjg0jYpSn0NcsCR5cSrLmdfr5fxnKsuGq5zD9TxpZc
      if (response.statusCode == 200) {
        // List<GetComplaintCategoryModel> complaint = List<GetComplaintCategoryModel>.from(response.data["complaints"].map((e) => GetComplaintCategoryModel.fromJson(e))).toList();
        GetComplainIdModel complainId = GetComplainIdModel.fromJson(response.data['complaint']);
        // List<GetComplaintCategoryModel> complaintCategory = List<GetComplaintCategoryModel>.from(response.data['complaintCategory'].map(e)) => GetComplaintCategoryModel.fromJson(model);
        print(complainId);
        return complainId;
      } else
        throw "Error";
    } on DioException catch (e) {
      throw "Error";
    }
  }
}
