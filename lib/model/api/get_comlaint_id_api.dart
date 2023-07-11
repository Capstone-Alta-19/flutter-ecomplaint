import 'package:complainz/model/get_complaint_id_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';

class GetComplaintIdApi {
  Dio dio = Dio();

  Future<GetComplaintIdModel> getComplaintId({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.get("${AppUrl.getComplaintId}/$id",
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        GetComplaintIdModel complainId = GetComplaintIdModel.fromJson(response.data["complaint"]);

        return complainId;
      } else {
        throw Exception('Error');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
