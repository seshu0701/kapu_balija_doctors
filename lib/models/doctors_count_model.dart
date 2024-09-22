class DoctorsCountResponse {
  String message;
  bool status;
  DoctorsCountResultResponse doctorsCountResultResponse;

  DoctorsCountResponse(
      {required this.message,
      required this.status,
      required this.doctorsCountResultResponse});

  factory DoctorsCountResponse.fromJson(Map<String, dynamic> json) {
    return DoctorsCountResponse(
        message: json['message'],
        status: json['status'],
        doctorsCountResultResponse: json['result']);
  }
}

class DoctorsCountResultResponse {
  List<DoctorsCountModel> doctorsCountDataList;

  DoctorsCountResultResponse({required this.doctorsCountDataList});

  factory DoctorsCountResultResponse.fromJson(Map<String, dynamic> json) {
    return DoctorsCountResultResponse(doctorsCountDataList: json['data']);
  }
}

class DoctorsCountModel {
  int count;
  String specialization;

  DoctorsCountModel({required this.count, required this.specialization});

  factory DoctorsCountModel.fromJson(Map<String, dynamic> json) {
    return DoctorsCountModel(
        count: json['count'], specialization: json['specialization']);
  }
}
