// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import '../model/api/complaint_aspirasi_api.dart';

class CreateAspirasiViewModel extends ChangeNotifier {
  Enum? _createAspirasi;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isCreate = false;

  Enum? get createAspirasi => _createAspirasi;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isCreate => _isCreate;

  Future<void> createResultAspirasi({
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

      CreateAspirasiApi api = CreateAspirasiApi();
      _createAspirasi = await api.createAspirasi(
        type: type,
        category_id: category_id,
        photo_url: photo_url,
        video_url: video_url,
        description: description,
        is_public: is_public,
      );

      if (_createAspirasi == Type.success) {
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
