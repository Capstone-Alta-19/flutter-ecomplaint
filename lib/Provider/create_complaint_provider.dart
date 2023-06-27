// ignore_for_file: unused_import, non_constant_identifier_names

import 'package:complainz/screen/status/detail_status_complaint.dart';

import 'package:flutter/foundation.dart';

import '../model/api/create_complaint_api.dart';

class CreateComplaintViewModel extends ChangeNotifier {
  Enum? _createComplaint;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isCreate = false;

  Enum? get createComplaint => _createComplaint;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isCreate => _isCreate;

  Future<void> createResultComplaint({
    required String type,
    required int category_id,
    required String photo_url,
    required String video_url,
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
        _isCreate = true;
        _isLoading = false;
        notifyListeners();
      } else {
        _isCreate = false;
        _isLoading = false;
        notifyListeners();
      }
    } catch (error) {
      _isCreate = false;
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
