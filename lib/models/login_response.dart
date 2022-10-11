import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.msg,
    required this.token,
  });

  String msg;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        msg: json['msg'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "token": token,
      };
}
