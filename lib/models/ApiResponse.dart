class ApiResponseModel {
  String message = "";
  bool success = false;

  ApiResponseModel({required this.message, required this.success});

  factory ApiResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    return ApiResponseModel(
        message: parsedJson['message'].toString(),
        success: parsedJson['success']);
  }
}
