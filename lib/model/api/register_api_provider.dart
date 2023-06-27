import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/app_url.dart';

enum Type { success, fail }

class CreateRegisterApi {
  Dio dio = Dio();

  Future createRegister({
    required String username,
    required String email,
    required String phone,
    required String date_birth,
    required String password,
    required String confirm_password,
  }) async {
    try {
      var response = await dio.post("${AppUrl.baseUrl}/register/user",
          data: {
            "username": username,
            "email": email,
            "phone": phone,
            "date_birth": date_birth,
            "password": password,
            "confirm_password": confirm_password,
          },
          options: Options(headers: {
            'Content-type': 'application/json; charset=UTF-8',
          }));

      print(response.statusCode);
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJyb2xlIjoiVVNFUiIsInVzZXJJZCI6MX0.sKjg0jYpSn0NcsCR5cSrLmdfr5fxnKsuGq5zD9TxpZc
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(response.data);
        await prefs.setString('token', response.data['user']['token']);
        // List<GetComplaintCategoryModel> complaint = List<GetComplaintCategoryModel>.from(response.data["complaints"].map((e) => GetComplaintCategoryModel.fromJson(e))).toList();

        // List<GetComplaintCategoryModel> complaintCategory = List<GetComplaintCategoryModel>.from(response.data['complaintCategory'].map(e)) => GetComplaintCategoryModel.fromJson(model);

        return Type.success;
      } else {
        throw Type.fail;
      }
    } on DioException {
      throw Type.fail;
    }
  }
}



/* enum Type { success, fail }

class CreateComplaintApi {
  Dio dio = Dio();

  Future createComplaint({
    required String type,
    required String category_id,
    required String? photo_url,
    required String? video_url,
    required String description,
    required bool is_public,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response =
          await dio.post("http://178.128.210.192:8080/complaintz/complaint",
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

//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJyb2xlIjoiVVNFUiIsInVzZXJJZCI6MX0.sKjg0jYpSn0NcsCR5cSrLmdfr5fxnKsuGq5zD9TxpZc
      if (response.statusCode == 200) {
        print(response.data);
        // List<GetComplaintCategoryModel> complaint = List<GetComplaintCategoryModel>.from(response.data["complaints"].map((e) => GetComplaintCategoryModel.fromJson(e))).toList();

        // List<GetComplaintCategoryModel> complaintCategory = List<GetComplaintCategoryModel>.from(response.data['complaintCategory'].map(e)) => GetComplaintCategoryModel.fromJson(model);

        return Type.success;
      } else {
        throw Type.fail;
      }
    } on DioException {
      throw Type.fail;
    }
  }
} */
