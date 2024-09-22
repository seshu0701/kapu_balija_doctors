

class LoginResponseModel {
  String message = "";
  bool status = false;

  LoginResponseModel({required this.message, required this.status});

  factory LoginResponseModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson);
    return LoginResponseModel(
        message: parsedJson['message'].toString(),
        status: parsedJson['status']);
  }
}

class Specialization {
  final String icon;
  final String title;
  final int count;

  const Specialization(
      {required this.icon, required this.title, required this.count});
}
