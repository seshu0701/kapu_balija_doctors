class StatesModel {
  String id;
  String stateName;

  StatesModel({required this.id, required this.stateName});

  factory StatesModel.fromJson(Map<String, dynamic> json) {
    return StatesModel(id: json['_id'], stateName: json['state']);
  }
}
