/* import 'package:flutter/foundation.dart';
import 'package:complainz/model/api/complainz_api.dart';
import 'package:complainz/model/complainz_model.dart';

class UserRepository {
  final ComplainzAPI _apiService;

  UserRepository({required ComplainzAPI apiService}) : _apiService = apiService;

  Future<List<Complainz>> getComplainz(Complainz user) async {
    try {
      return await _apiService.getComplainz.toString(user.email, user.password);
    } catch (error) {
      debugPrint('Gagal melakukan registrasi: $error');
      rethrow;
    }
  }
}
 */