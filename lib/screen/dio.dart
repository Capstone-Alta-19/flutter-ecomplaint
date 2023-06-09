import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestPost extends StatefulWidget {
  const TestPost({super.key});

  @override
  State<TestPost> createState() => _TestPostState();
}

class _TestPostState extends State<TestPost> {
  Dio dio = new Dio();

  Future postData(String username, String email, String phone, String password,
      String confirm_password) async {
    final String pathUrl = 'http://178.128.210.192:8080/register/user';

    dynamic data = {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
      "confirm_password": confirm_password
    };

    var response = await dio.post(pathUrl,
        data: data,
        options: Options(headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }));

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          color: Colors.black,
          onPressed: () async {
            print('Posting Data');
            await postData('rtx', 'rtx@gmail.com', '088787656565', "12345678",
                    "12345678")
                .then((value) {
              print(value);
            });
          },
          child: Text(
            'Posting',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
