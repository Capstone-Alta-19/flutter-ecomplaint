import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_url.dart';
import '../get_complaint_status_model.dart';

class GetComplaintStatusApi {
  Dio dio = Dio();

  Future<List<GetComplaintStatus>> getComplaitStatus({required String status}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? getToken = prefs.getString('token');
      prefs.containsKey('token');
      var response = await dio.get("${AppUrl.getComplaintStatus}$status",
          options: Options(headers: {
            'Authorization': 'Bearer $getToken',
            'Content-type': 'application/json; charset=UTF-8',
          }));

//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRob3JpemVkIjp0cnVlLCJyb2xlIjoiVVNFUiIsInVzZXJJZCI6MX0.sKjg0jYpSn0NcsCR5cSrLmdfr5fxnKsuGq5zD9TxpZc
      if (response.statusCode == 200) {
        // List<GetComplaintCategoryModel> complaint = List<GetComplaintCategoryModel>.from(response.data["complaints"].map((e) => GetComplaintCategoryModel.fromJson(e))).toList();

        List<GetComplaintStatus> complaintStatus = List<GetComplaintStatus>.from(response.data["complaints"].map((e) => GetComplaintStatus.fromJson(e))).toList();
        // List<GetComplaintCategoryModel> complaintCategory = List<GetComplaintCategoryModel>.from(response.data['complaintCategory'].map(e)) => GetComplaintCategoryModel.fromJson(model);
        print(complaintStatus);
        return complaintStatus;
      } else {
        throw Exception('Error');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
