class LoginResponse {
  int? code;
  bool? success;
  String? message;
  LoginData? data;

  LoginResponse({this.code, this.success, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? userid;
  String? token;

  LoginData({this.userid, this.token});

  LoginData.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['token'] = token;
    return data;
  }
}
