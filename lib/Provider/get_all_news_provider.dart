import 'package:flutter/foundation.dart';

import '../model/api/get_all_news_api.dart';

import '../model/get_all_news_model.dart';

class GetAllNewsViewModel extends ChangeNotifier {
  List<GetAllNewsModel> _allNews = [];
  String _errorMessage = '';
  bool _isLoading = true;

  List<GetAllNewsModel> get allNews => _allNews;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getResultAllNews() async {
    try {
      _isLoading = true;
      notifyListeners();

      GetAllNewsApi api = GetAllNewsApi();
      _allNews = await api.getAllNews();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      _errorMessage = error.toString();
      notifyListeners();
    }
  }
}
