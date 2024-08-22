class ResponseModel {
  final String status;
  final String message;
  final int statusCode;
  final dynamic data;

  const ResponseModel({
    required this.data,
    required this.status,
    required this.message,
    required this.statusCode,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      data: json['data'],
      status: json['status'],
      message: json['message'],
      statusCode: json['statusCode'],
    );
  }
}
