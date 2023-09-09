class DoctorDetails {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  int? phone;
  String? education;
  String? speciality;
  String? treatedDiseases;
  String? address;
  String? clinicAddress;

  DoctorDetails(
      this.id,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.phone,
      this.education,
      this.speciality,
      this.treatedDiseases,
      this.address,
      this.clinicAddress);

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    email = json['email'];
    phone = json['phone'];
    education = json['education'];
    speciality = json['speciality'];
    treatedDiseases = json['treatedDiseases'];
    address = json['address'];
    clinicAddress = json['clinicAddress'];
  }
}
