class CitiesMainModel {
  bool status;
  List<dynamic> citiesList;

  CitiesMainModel({required this.status, required this.citiesList});

  factory CitiesMainModel.fromJson(Map<String, dynamic> json) {
    return CitiesMainModel(
        status: json['status'], citiesList: List<dynamic>.from(json['data']));
    //citiesList: json['data']);//json['data']);
  }
}

class CitiesModel {
  String id;
  String city;

  CitiesModel({required this.id, required this.city});

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(id: json['_id'], city: json['city']);
  }
}
