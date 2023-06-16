import 'package:dio/dio.dart';

import '../../config/app_url.dart';

Dio dio = Dio();

Future postData(String username, String email, String phone, String password, String confirm_password) async {
  //final String pathUrl = 'http://178.128.210.192:8080/register/user';

  dynamic data = {"username": username, "email": email, "phone": phone, "password": password, "confirm_password": confirm_password};

  var response = await dio.post(AppUrl.register,
      data: data,
      options: Options(headers: {
        'Content-type': 'application/json; charset=UTF-8',
      }));

  return response.data;
}











/* class RegisterAPI {
  static Future<List<Register>> getComplainz(Register user) async {
    final response = await Dio().post(
        "https://api.postman.com/collections/26517696-8cda4f51-6d5e-42ba-959f-94ec8624a36a?access_key=PMAT-01H142C5AME7BSR58D82667K7V");
    List<Register> register = (response.data as List)
        .map(
          (e) => Register(
            username: e['username'],
            email: e['email'],
            phone: e['phone'],
            password: e['password'],
            //confirm_password: e['confirm_password'],
          ),
        )
        .toList();
    return register;
  }
} */


