import 'package:complainz/model/api/delete_compliant_api.dart';
import 'package:complainz/model/api/login.dart';
import 'package:complainz/screen/status/detail_status_complaint.dart';

import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  LoginStatus? _login;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isLogin = false;
  LoginStatus? get login => _login;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isLogin => _isLogin;

  Future<void> loginResultApi({required String username, required String password}) async {
    try {
      _isLoading = true;
      notifyListeners();

      LoginApi api = LoginApi();
      _login = await api.login(usernameEmail: username, password: password);
      print(_isLoading);
      if (_login == LoginStatus.success) {
        _isLogin = true;
        _isLoading = false;
        print("status oke ${_isLoading}");
        notifyListeners();
      } else {
        _isLogin = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isLoading = false;
      _isLogin = false;
      print(_isLoading);
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
