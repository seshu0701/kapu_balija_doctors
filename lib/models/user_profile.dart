class UserProfile {
  String firstName;
  String lastName;
  String password;
  String gender;
  String dateOfBirth;
  HomeAddress? homeAddress;
  String contactNumber = "";
  String email = "";
  ProfessionalDetails? professionalDetails;
  CommunityDetails? communityDetails;
  CommunicationPreferences? communicationPreferences;

  UserProfile({
    this.firstName = "",
    this.lastName = "",
    this.password = "",
    this.gender = "",
    this.dateOfBirth = "",
    this.contactNumber = "",
    this.email = "",
    this.homeAddress,
    this.professionalDetails,
    this.communityDetails,
    this.communicationPreferences,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'contactNumber': contactNumber,
      'email': email,
      'homeAddress': homeAddress,
      'professionalDetails': professionalDetails,
      'communityDetails': communityDetails,
      'communicationPreferences': communicationPreferences
    };
  }
}

class HomeAddress {
  String address;
  String city;
  String state;
  String country;

  HomeAddress(
      {required this.address,
      required this.city,
      required this.state,
      required this.country});

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}

class ProfessionalDetails {
  String specialization;
  String hospitalName;
  List<String> hospitalAddress = List.empty();
  List<String> clinicAddress = List.empty();
  String workExperienceInYears;
  String medicalLicenseNumber;
  List<String> mostlyTreatedDiseases = List.empty();
  List<String> medicalCertificates = List.empty();
  String castCertificate;
  String identificationProof;

  ProfessionalDetails(
      {this.specialization = "",
      this.hospitalName = "",
      this.workExperienceInYears = "",
      this.medicalLicenseNumber = "",
      this.castCertificate = "",
      this.identificationProof = "",
      required this.hospitalAddress,
      required this.clinicAddress,
      required this.mostlyTreatedDiseases,
      required this.medicalCertificates});

  Map<String, dynamic> toJson() {
    return {
      'specialization': specialization,
      'hospitalName': hospitalName,
      'workExperienceInYears': workExperienceInYears,
      'medicalLicenseNumber': medicalLicenseNumber,
      'castCertificate': castCertificate,
      'identificationProof': identificationProof,
      'hospitalAddress': hospitalAddress,
      'clinicAddress': clinicAddress,
      'mostlyTreatedDiseases': mostlyTreatedDiseases,
      'medicalCertificates': medicalCertificates
    };
  }
}

class CommunityDetails {
  bool kapuCommunityAffiliation;
  List<String> communityReferrals = List.empty();

  CommunityDetails(
      {this.kapuCommunityAffiliation = false,
      required this.communityReferrals});

  Map<String, dynamic> toJson() {
    return {
      'kapuCommunityAffiliation': kapuCommunityAffiliation,
      'communityReferrals': communityReferrals,
    };
  }
}

class CommunicationPreferences {
  String notificationPreferenceOnApp = "Push";
  String communicationChannel = "Email";

  CommunicationPreferences(
      {this.notificationPreferenceOnApp = "Push",
      this.communicationChannel = "Email"});

  Map<String, dynamic> toJson() {
    return {
      'notificationPreferenceOnApp': notificationPreferenceOnApp,
      'communicationChannel': communicationChannel,
    };
  }
}
