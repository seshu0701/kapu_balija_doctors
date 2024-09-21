import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kapu_balija_doctors/models/ApiResponse.dart';
import 'package:kapu_balija_doctors/services/helper.dart';

import '../models/user_profile.dart';

class ApiService {
  static const String baseUrl =
      'http://ec2-18-61-244-163.ap-south-2.compute.amazonaws.com/api/';

  static Future<ApiResponseModel> registerUser(UserProfile userProfile) async {
    const String url = '${baseUrl}register';

    try {
      var requestBody = json.encode({
        'email': userProfile.email,
        'password': userProfile.password,
        'firstName': userProfile.firstName,
        'lastName': userProfile.lastName,
        'contactNumber': userProfile.contactNumber,
        'dateOfBirth': userProfile.dateOfBirth,
        'homeAddress': userProfile.homeAddress,
        'communityDetails': userProfile.communityDetails,
        'communicationPreferences': userProfile.communicationPreferences,
        'gender': userProfile.gender,
        'professionalDetails': userProfile.professionalDetails
      });
      printLog("register url", url);
      printLog("register request", requestBody);
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      printLog("register response",
          "status ${response.statusCode.toString()} body ${response.body}");
      var responseBody = json.decode(response.body);
      return ApiResponseModel(
          message: responseBody['message'], success: responseBody['success']);
    } catch (e) {
      return ApiResponseModel(message: e.toString(), success: false);
    }
  }

  static Future<ApiResponseModel> loginUser(
      String emailId, String password) async {
    const String url = '${baseUrl}login';
    try {
      var requestBody = json.encode({'email': emailId, 'password': password});
      printLog("login url", url);
      printLog("login request", requestBody);
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      printLog("login response",
          "status ${response.statusCode.toString()} body ${response.body}");
      var responseBody = json.decode(response.body);
      return ApiResponseModel(
          message: responseBody['message'], success: responseBody['success']);
    } catch (e) {
      return ApiResponseModel(message: e.toString(), success: false);
    }
  }

  static Future<bool> resetPassword(String username, String password) async {
    const String url = '${baseUrl}account/reset-password';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);

        if (responseBody['status'] == "ERROR") {
          print('Error: ${responseBody['message']}');
          return false;
        }

        return true;
      } else {
        print('Password reset failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error making request: $e');
      return false;
    }
  }
}