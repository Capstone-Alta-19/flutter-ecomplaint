import 'package:flutter/foundation.dart';

import '../model/api/get_complaint_status_api.dart';
import '../model/get_complaint_status_model.dart';

class GetComplaintStatusViewModel extends ChangeNotifier {
  List<GetComplaintStatus> _complaintStatus = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<GetComplaintStatus> get complaintStatus => _complaintStatus;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getResultCompaintStatus({required String status}) async {
    try {
      _isLoading = true;
      notifyListeners();

      GetComplaintStatusApi api = GetComplaintStatusApi();
      _complaintStatus = await api.getComplaitStatus(status: status);

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
