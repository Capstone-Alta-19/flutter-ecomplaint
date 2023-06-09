// import 'package:dio/dio.dart';
// import 'package:flutter_ecomplaint/config/app_url.dart';

// class ApiClient {
//   final Dio _dio = Dio();

//   // Future<Response> registerUser() async {
//   //   //IMPLEMENT USER REGISTRATION
//   // }

//   Future<Response> login() async {
//     try {
//       Response response = await _dio.post(
//         AppUrl.baseUrl,
//         data: {"username_or_email": "12345678", "password": "12345678"},
//       );
//       //returns the successful user data json object
//       return response.data;
//     } on DioException catch (e) {
//       //returns the error object if any
//       return e.response!.data;
//     }
//   }
// }
//     Future<Response> getUserProfileData() async {
//         //GET USER PROFILE DATA
//     }

//     Future<Response> logout() async {
//         //IMPLEMENT USER LOGOUT
//      }
// }

// import 'package:dio/dio.dart';
// import 'package:flutter_ecomplaint/config/app_url.dart';

// void main() {
//   final dio = Dio();

//   void request() async {
//     final response = await dio.post('${AppUrl.login}', data: {"username_or_email": "halim", "password": "12345678"});
//     print(response.data.toString());
//   }
// }

// import 'package:dio/dio.dart';

// import '../config/app_url.dart';

// final dio = Dio();

// Future<String> loginUser(String email, String password) async {
//   final url = '${AppUrl.login}';

//   try {
//     final response = await dio.post(
//       url,
//       data: {
//         'username_or_email': email,
//         'password': password,
//       },
//     );

//     if (response.statusCode == 200) {
//       // Successful login
//       return response.data.toString();
//     } else {
//       // Handle other status codes
//       return 'Login failed';
//     }
//   } catch (error) {
//     // Handle any errors that occur during the API call
//     return 'An error occurred';
//   }
// }

// import 'package:dio/dio.dart';
// import 'package:flutter_ecomplaint/config/app_url.dart';

// Future<Response?> signIn() async {
//   var dio = Dio();
//   try {
//     var response = await dio.post('${AppUrl.login}',
//         options: Options(
//           headers: {
//             "username_or_email": "halim",
//             "password": "12345678",
//           },
//         ));
//     print(response.data);
//     return response;
//   } catch (e) {
//     print(e.toString());
//   }
//   return null;
// }

import 'package:dio/dio.dart';
import 'package:flutter_ecomplaint/config/app_url.dart';

Dio dio = new Dio();

Future login(
  String usernameEmail,
  String password,
) async {
  dynamic data = {
    "username_or_email": usernameEmail,
    "password": password,
  };

  var response = await dio.post(AppUrl.login,
      data: data,
      options: Options(headers: {
        'Content-type': 'application/json; charset=UTF-8',
      }));

  return response.data;
}
