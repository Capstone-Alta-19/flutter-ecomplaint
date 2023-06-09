import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';

enum LoginStatus { success, failed }

class LoginApi {
  Dio dio = Dio();

  Future<LoginStatus> login({
    required String usernameEmail,
    required String password,
  }) async {
    dynamic data = {
      "username_or_email": usernameEmail,
      "password": password,
    };
    try {
      var response = await dio.post(AppUrl.login,
          data: data,
          options: Options(headers: {
            'Content-type': 'application/json; charset=UTF-8',
          }));
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['user']['token']);
        return LoginStatus.success;
      } else {
        return LoginStatus.failed;
      }
    } on DioException {
      return LoginStatus.failed;
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter_ecomplaint/config/app_url.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'auth_token.dart';

// class AuthClass {
//   Dio dio = Dio();

//   Future login(
//     String usernameEmail,
//     String password,
//   ) async {
//     dynamic data = {
//       "username_or_email": usernameEmail,
//       "password": password,
//     };
//     try {
//       var response = await dio.post(AppUrl.login,
//           data: data,
//           options: Options(headers: {
//             'Content-type': 'application/json; charset=UTF-8',
//           }));
//       final jsonResponse = response.data;
//       final authToken = AuthToken.fromJson(jsonResponse);
//       Future<void> saveUser(authToken) async {
//         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//         await sharedPreferences.setString('access_token', authToken);
//       }

//       if (response.statusCode == 200) {
//         saveUser(authToken.user?.token);

//         Future<void> getUser() async {
//           SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//           sharedPreferences.getString('access_token');
//         }

//         return await getUser();
//       } else if (response.statusCode != 200) {
//         return authToken.message;
//       }
//     } on DioException {
//       return "Username atau Password Salah";
//     }
//   }
// }
