import 'dart:convert';

class NewsError {
  NewsError({
    this.status,
    this.code,
    this.message,
  });

  String status;
  String code;
  String message;

  factory NewsError.fromJson(Map<String, dynamic> json) => NewsError(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };
}
