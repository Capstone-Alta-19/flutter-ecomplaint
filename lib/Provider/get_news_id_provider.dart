import 'package:complainz/model/api/get_all_news_api.dart';
import 'package:complainz/model/api/get_comlaint_id_api.dart';
import 'package:complainz/model/get_complaint_id_model.dart';
import 'package:complainz/model/get_news_id_model.dart';
import 'package:flutter/foundation.dart';

import '../model/api/get_news_id_api.dart';

class GetNewsIdViewModel extends ChangeNotifier {
  GetNewsIdModel? _complaintId;
  String _errorMessage = '';
  bool _isLoading = true;

  GetNewsIdModel? get complaintId => _complaintId;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getResultNewsId({required int id}) async {
    try {
      _isLoading = true;
      notifyListeners();

      GetNewsIdApi api = GetNewsIdApi();
      _complaintId = await api.getNewsId(id: id);

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
