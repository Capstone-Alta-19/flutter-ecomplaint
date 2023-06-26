import 'package:complainz/model/api/login.dart';
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
      if (_login == LoginStatus.success) {
        _isLogin = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _isLogin = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isLoading = false;
      _isLogin = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
