import 'package:flutter/foundation.dart';
import 'package:complainz/model/GetComplaintCategoryModel.dart';

import '../model/api/get_complaint_category_api.dart';

class GetComplaintCategoryViewModel extends ChangeNotifier {
  List<GetComplaintCategoryModel> _complaintCategory = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<GetComplaintCategoryModel> get complaintCategory => _complaintCategory;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getResultCompaintCategory({required String category, required sort}) async {
    try {
      _isLoading = true;
      notifyListeners();

      GetComplaintCategoryApi api = GetComplaintCategoryApi();
      _complaintCategory = await api.getComplaintCategory(category: category, sort: sort);

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
