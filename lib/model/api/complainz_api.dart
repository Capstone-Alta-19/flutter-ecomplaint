import 'package:complainz/model/complainz_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ComplainzAPI {
  static Future<List<Complainz>> getComplainz(Complainz user) async {
    final response = await Dio().post(
        "https://api.postman.com/collections/26517696-8cda4f51-6d5e-42ba-959f-94ec8624a36a?access_key=PMAT-01H142C5AME7BSR58D82667K7V");
    List<Complainz> complainz = (response.data as List)
        .map(
          (e) => Complainz(
            username: e['username'],
            email: e['email'],
            phone: e['phone'],
            password: e['password'],
            //confirm_password: e['confirm_password'],
          ),
        )
        .toList();
    return complainz;
  }
}
