// import 'package:diary_journal/core/api/utils/save_local_data.dart';

class ApiHeaderConstant {
  static const Map<String, String> headerWithoutToken = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  static Future<Map<String, String>> headerWithToken() async {
    // final String token = await SaveLocalData.getToken();
    // print(token);

    final Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      // 'Authorization': 'Bearer $token',
    };

    return headers;
  }
}
