import 'package:gerador_json/core/model/user.dart';

class JwtObj {
  static const String ACCESS_TOKEN = 'access_token';
  static const String TOKEN_TYPE = 'token_type';
  static const String EXPIRES_IN = 'expires_in';
  static const String USER_ID = 'user_id';
  static const String USER = 'user';

  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final int userId;
  final User? user;

  const JwtObj(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn,
      required this.userId,
      this.user});

  static JwtObj fromJson(Map<String, dynamic> json) => JwtObj(
        accessToken: json[ACCESS_TOKEN] as String,
        tokenType: json[TOKEN_TYPE] as String,
        expiresIn: json[EXPIRES_IN] as int,
        userId: json[USER_ID] as int,
        user: json[USER] != null ? User.fromJson(json[USER]) : null,
      );

  Map<String, Object?> toJson() => {
        ACCESS_TOKEN: this.accessToken,
        TOKEN_TYPE: this.tokenType,
        EXPIRES_IN: this.expiresIn,
        USER_ID: this.userId,
        USER: this.user != null ? this.user!.toJson() : this.user,
      };
}
