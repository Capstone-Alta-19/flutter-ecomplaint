import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';

enum Type { deleted, fail }

class DeleteComplaintIdApi {
  Dio dio = Dio();

  Future deleteComplaintId({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.delete("${AppUrl.baseUrl}/complaintz/complaint/$id",
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        return Type.deleted;
      } else {
        throw Type.fail;
      }
    } on DioException {
      throw Type.fail;
    }
  }
}
