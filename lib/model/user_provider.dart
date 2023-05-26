import 'package:flutter/material.dart';
import 'package:complainz/model/api/complainz_api.dart';
import 'package:complainz/model/complainz_model.dart';

class UserProvider extends ChangeNotifier {
  final ComplainzAPI _userRepository;
  String _registrationStatus = '';

  UserProvider({required ComplainzAPI userRepository})
      : _userRepository = userRepository;

  String get registrationStatus => _registrationStatus;

  Future<void> registerUser(Complainz user) async {
    try {
      _registrationStatus = 'Sedang melakukan registrasi...';
      notifyListeners();

      final response = await ComplainzAPI.getComplainz(user);
      _registrationStatus = response as String;
    } catch (error) {
      _registrationStatus = 'Gagal melakukan registrasi';
      debugPrint('Gagal melakukan registrasi: $error');
    } finally {
      notifyListeners();
    }
  }
}
