import 'package:complainz/model/api/get_comlaint_id_api.dart';
import 'package:complainz/model/get_complaint_id_model.dart';
import 'package:flutter/foundation.dart';

import '../model/api/get_complaint_category_api.dart';

class GetComplaintIdViewModel extends ChangeNotifier {
  GetComplainIdModel? _complaintId;
  String _errorMessage = '';
  bool _isLoading = true;

  GetComplainIdModel? get complaintId => _complaintId;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getResultCompaintId({required int id}) async {
    try {
      _isLoading = true;
      notifyListeners();

      GetComplaintIdApi api = GetComplaintIdApi();
      _complaintId = await api.getComplaintId(id: id);
      print(complaintId);

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
