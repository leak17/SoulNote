import 'package:diary_journal/core/api/utils/save_local_data.dart';

class ApiHeaderConstant {
  static const Map<String, String> headerWithoutToken = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  static Future<Map<String, String>> headerWithinToken() async {
    String token = await SaveLocalData.getToken();
    print(token);
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
  }
}
