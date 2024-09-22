class ApiResponseModel {
  String message = "";
  bool status = false;

  ApiResponseModel({required this.message, required this.status});

  factory ApiResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    return ApiResponseModel(
        message: parsedJson['message'].toString(),
        status: parsedJson['status']);
  }
}
