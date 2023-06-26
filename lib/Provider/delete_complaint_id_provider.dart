import 'package:complainz/model/api/delete_compliant_api.dart';

import 'package:flutter/foundation.dart';

class DeleteComplaintIdViewModel extends ChangeNotifier {
  Enum? _deleteComplaintId;
  String _errorMessage = '';
  bool _isLoading = true;
  bool _isDeleted = false;

  Enum? get deleteComplaintId => _deleteComplaintId;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  bool get isDeleted => _isDeleted;

  Future<void> deleteResultCompaintId({required int id}) async {
    try {
      _isLoading = true;
      notifyListeners();

      DeleteComplaintIdApi api = DeleteComplaintIdApi();
      _deleteComplaintId = await api.deleteComplaintId(id: id);

      if (_deleteComplaintId == Type.deleted) {
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
