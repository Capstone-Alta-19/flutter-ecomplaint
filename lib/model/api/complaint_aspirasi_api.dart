import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/app_url.dart';

enum Type { success, fail }

class CreateAspirasiApi {
  Dio dio = Dio();

  Future createAspirasi({
    required String type,
    required int category_id,
    required String photo_url,
    required String video_url,
    required String description,
    required bool is_public,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.post("${AppUrl.baseUrl}/complaintz/complaint",
          data: {
            "type": type,
            "category_id": category_id,
            "photo_url": photo_url,
            "video_url": video_url,
            "description": description,
            "is_public": is_public,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        return Type.success;
      } else {
        throw Type.fail;
      }
    } on DioException {
      throw Type.fail;
    }
  }
}
