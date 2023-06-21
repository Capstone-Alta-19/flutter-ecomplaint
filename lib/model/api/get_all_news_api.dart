import 'package:complainz/model/get_all_news_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';

class GetAllNewsApi {
  Dio dio = Dio();

  Future<List<GetAllNewsModel>> getAllNews() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.get(AppUrl.getAllNews,
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

      if (response.statusCode == 200) {
        List<GetAllNewsModel> allNews = List<GetAllNewsModel>.from(response.data["News"].map((e) => GetAllNewsModel.fromJson(e))).toList();

        return allNews;
      } else {
        throw "Error";
      }
    } on DioException {
      throw "Error";
    }
  }
}
