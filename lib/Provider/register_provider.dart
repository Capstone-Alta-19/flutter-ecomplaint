// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:complainz/screen/status/detail_status_complaint.dart';
import 'package:flutter/foundation.dart';
import '../model/api/register_api_provider.dart';

class CreateRegisterViewModel extends ChangeNotifier {
  Enum? _createRegister;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isRegister = false;

  Enum? get createRegister => _createRegister;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isRegister => _isRegister;

  Future<void> createResultRegister({
    required String username,
    required String email,
    required String phone,
    required String date_birth,
    required String password,
    required String confirm_password,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      CreateRegisterApi api = CreateRegisterApi();
      _createRegister = await api.createRegister(
        username: username,
        email: email,
        phone: phone,
        date_birth: date_birth,
        password: password,
        confirm_password: confirm_password,
      );

      if (_createRegister == Type.success) {
        _isRegister = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _isRegister = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isRegister = false;
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
