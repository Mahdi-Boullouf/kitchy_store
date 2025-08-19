// lib/app/api_response_model.dart

class ApiResponseModel<T> {
  final bool success;
  final String? message;
  final T? data;

  ApiResponseModel({
    required this.success,
    this.message,
    this.data,
  });

  factory ApiResponseModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponseModel(
      success: json['success'] ?? true,
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}
