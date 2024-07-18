class BaseResponseModel {
  final int code;
  final String message;
  final dynamic error;
  final dynamic errors;

  BaseResponseModel({
    required this.code,
    required this.message,
    this.error,
    this.errors,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      BaseResponseModel(
        code: json["code"] as int,
        message: json["message"] as String,
        error: json["error"],
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
    'code': code,
    'message': message,
    'error': error,
    'errors': errors,
  };
}

class BaseResponseMeta {
  late final int total;
  late final String next;
  late final String prev;

  BaseResponseMeta({
    this.total = 0,
    this.next = '',
    this.prev = '',
  });

  factory BaseResponseMeta.fromJson(Map<String, dynamic> json) =>
      BaseResponseMeta(
        total: json['total'],
        next: json['next'] ?? '',
        prev: json['prev'] ?? '',
      );

  Map<String, dynamic> toJson() => {
    'total': total,
    'next': next,
    'prev': prev,
  };
}
