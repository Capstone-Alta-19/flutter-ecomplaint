import 'package:complainz/screen/status/detail_status_complaint.dart';
import 'package:flutter/foundation.dart';
import '../model/api/register_api_provider.dart';

class CreateRegisterViewModel extends ChangeNotifier {
  Enum? _createRegister;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isDeleted = false;

  Enum? get createRegister => _createRegister;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isDeleted => _isDeleted;

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
        _isDeleted = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _isDeleted = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isDeleted = false;
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}


/* class CreateComplaintViewModel extends ChangeNotifier {
  Enum? _createComplaint;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isDeleted = false;

  Enum? get createComplaint => _createComplaint;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isDeleted => _isDeleted;

  Future<void> createResultCompaint({
    required String type,
    required String category_id,
    required String? photo_url,
    required String? video_url,
    required String description,
    required bool is_public,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      CreateComplaintApi api = CreateComplaintApi();
      _createComplaint = await api.createComplaint(
        type: type,
        category_id: category_id,
        photo_url: photo_url,
        video_url: video_url,
        description: description,
        is_public: is_public,
      );

      if (_createComplaint == Type.success) {
        _isDeleted = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _isDeleted = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isDeleted = false;
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
 */