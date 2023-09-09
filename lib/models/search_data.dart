class SearchData{

  String? firstName;
  String? lastName;
  String? middleName;
  String? password;
  String? hashedPassword;
  String? email;
  int? phone;
  String? status;
  int? roleId;
  String? education;
  String? speciality;
  String? treatedDiseases;
  String? address;
  String? clinicAddress;
  String? createdAt;
  String? updatedAt;
  int? id;

  SearchData(
      {this.firstName,
        this.lastName,
        this.middleName,
        this.password,
        this.hashedPassword,
        this.email,
        this.phone,
        this.status,
        this.roleId,
        this.education,
        this.speciality,
        this.treatedDiseases,
        this.address,
        this.clinicAddress,
        this.createdAt,
        this.updatedAt,
        this.id});

  SearchData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    password = json['password'];
    hashedPassword = json['hashedPassword'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    roleId = json['roleId'];
    education = json['education'];
    speciality = json['speciality'];
    treatedDiseases = json['treatedDiseases'];
    address = json['address'];
    clinicAddress = json['clinicAddress'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middleName'] = middleName;
    data['password'] = password;
    data['hashedPassword'] = hashedPassword;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    data['roleId'] = roleId;
    data['education'] = education;
    data['speciality'] = speciality;
    data['treatedDiseases'] = treatedDiseases;
    data['address'] = address;
    data['clinicAddress'] = clinicAddress;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}