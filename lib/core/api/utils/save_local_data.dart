// import 'package:shared_preferences/shared_preferences.dart';

// class SaveLocalData {
//   static const String token = "token";
//   static const String isLogin = "login";
//   static const String userId = "userId";

//   static Future<void> setToken(String userToken) async {
//     var sharePreference = await SharedPreferences.getInstance();
//     await sharePreference.setString(token, userToken);
//   }

//   static Future<String> getToken() async {
//     var sharePreference = await SharedPreferences.getInstance();
//     return sharePreference.getString(token) ?? "";
//   }

//   static Future<void> setIsLogin(bool login) async {
//     var sharePreference = await SharedPreferences.getInstance();
//     await sharePreference.setBool(isLogin, login);
//   }

//   static Future<bool> getIsLogin() async {
//     var sharePreference = await SharedPreferences.getInstance();
//     return sharePreference.getBool(isLogin) ?? false;
//   }

//   static Future<void> setUserId(int id) async {
//     var sharePreference = await SharedPreferences.getInstance();
//     await sharePreference.setInt(userId, id);
//   }

//   static Future<int> getUserId() async {
//     var sharePreference = await SharedPreferences.getInstance();
//     return sharePreference.getInt(userId) ?? 0;
//   }
// }
