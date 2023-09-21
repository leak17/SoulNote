import 'package:shared_preferences/shared_preferences.dart';

class SaveLocalData {
  static const String token = "token";
  static const String isLogin = "login";
  static const String userId = "userId";

  static Future<void> setToken(String userToken) async {
    var sharePreference = await SharedPreferences.getInstance();
    await sharePreference.setString(token, userToken);
  }

  static Future<String> getToken() async {
    var sharePreference = await SharedPreferences.getInstance();
    return sharePreference.getString(token) ?? "";
  }

  static Future<void> setIsLogin(bool login) async {
    var sharePreference = await SharedPreferences.getInstance();
    await sharePreference.setBool(isLogin, login);
  }

  static Future<bool> getIsLogin() async {
    var sharePreference = await SharedPreferences.getInstance();
    return sharePreference.getBool(isLogin) ?? false;
  }

  // Modify this to save the userId as String
  static Future<void> setUserId(String id) async {
    var sharePreference = await SharedPreferences.getInstance();
    await sharePreference.setString(userId, id);
  }

// Modify this to retrieve the userId as String
  static Future<String> getUserId() async {
    var sharePreference = await SharedPreferences.getInstance();
    return sharePreference.getString(userId) ?? "";
  }

  static Future<void> logout() async {
    var sharePreference = await SharedPreferences.getInstance();
    await sharePreference.remove(token); // Removes the token
    await sharePreference.remove(isLogin); // Removes the login status
    await sharePreference.remove(userId); // Removes the userId

    print("Token after logout: ${sharePreference.getString(token)}");
    print("IsLogin after logout: ${sharePreference.getBool(isLogin)}");
    print("UserId after logout: ${sharePreference.getString(userId)}");
  }
}
