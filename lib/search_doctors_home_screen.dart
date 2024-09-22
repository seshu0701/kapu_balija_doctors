import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kapu_balija_doctors/models/doctors_count_model.dart';
import 'package:kapu_balija_doctors/models/states_model.dart';
import 'package:kapu_balija_doctors/services/helper.dart';
import 'package:kapu_balija_doctors/utils/api_service.dart';
import 'package:kapu_balija_doctors/utils/constants.dart';
import 'package:kapu_balija_doctors/utils/images.dart';

import 'doctors_model.dart';
import 'models/params.dart';

class SearchDoctorsHomeScreen extends StatefulWidget {
  const SearchDoctorsHomeScreen({super.key});

  @override
  State createState() => _SearchDoctorsHomeScreen();
}

class _SearchDoctorsHomeScreen extends State<SearchDoctorsHomeScreen> {
  final List<DoctorDetails> _doctorsList = <DoctorDetails>[];
  TextEditingController txtQuery = TextEditingController();
  bool isVisible = false;
  String selectState = "Select State";
  String selectCity = "Select City";

  late Future<List<StatesModel>> statesList;

  List<String> citiesList = List.empty(growable: true);

  //late Future<List<CitiesModel>> citiesList;
  List<DoctorsCountModel> doctorSpecializationsCount =
      List.empty(growable: true);

  List<Specialization> specializationList = const <Specialization>[
    Specialization(title: 'Neurology', count: 20, icon: neurologyIcon),
    Specialization(title: 'Medicine', count: 50, icon: medicineIcon),
    Specialization(title: 'Cardiology', count: 5, icon: cardiologyIcon),
    Specialization(title: 'Orthopedics', count: 2, icon: orthopedicsIcon),
    Specialization(title: 'Paediatrics', count: 10, icon: paediatricsIcon),
    Specialization(title: 'Surgery', count: 20, icon: surgeryIcon),
    Specialization(title: 'OBG', count: 1, icon: obgIcon),
    Specialization(title: 'Pulmonology', count: 8, icon: pulmonologyIcon),
  ];

  @override
  void initState() {
    super.initState();
    statesList = ApiService.fetchStates();
  }

  Future getCities() async {
    var citiesUrl =
        '${baseUrl}locations/cities?state=$selectState'; //"https://gssskhokhar.com/api/classes/$getClassCode";
    printLog('cities url', citiesUrl);
    http.Response responseSubject = await http.get(Uri.parse(citiesUrl));
    printLog('cities response',
        'status code ${responseSubject.statusCode.toString()} body ${responseSubject.body.toString()}');
    citiesList.clear();
    setState(() {
      doctorSpecializationsCount.clear();
    });
    if (responseSubject.statusCode == 200) {
      var jsonDataResponse = json.decode(responseSubject.body);
      if (jsonDataResponse['status']) {
        selectCity = "Select City";
        setState(() {
          var lCitiesMapList = List<dynamic>.from(jsonDataResponse['data']);
          citiesList.add(selectCity);
          for (var item in lCitiesMapList) {
            citiesList.add(item['city']);
          }
        });
      }
    }
  }

  Future getDoctorsCount() async {
    var url =
        '${baseUrl}getdoctorscount?searchItem=$selectCity'; //"https://gssskhokhar.com/api/classes/$getClassCode";
    printLog('get doctors count url', url);
    http.Response responseSubject = await http.get(Uri.parse(url));
    printLog('get doctors response',
        'status code ${responseSubject.statusCode.toString()} body ${responseSubject.body.toString()}');
    doctorSpecializationsCount.clear();
    if (responseSubject.statusCode == 200) {
      var jsonDataResponse = json.decode(responseSubject.body);
      if (jsonDataResponse['status']) {
        setState(() {
          var doctorsCountResultResponse = jsonDataResponse['result'];
          printLog("doctorsCountResultResponse", doctorsCountResultResponse);
          var lDoctorsCountDataResponse =
              List<dynamic>.from(doctorsCountResultResponse['data']);
          for (var item in lDoctorsCountDataResponse) {
            doctorSpecializationsCount.add(DoctorsCountModel(
                count: item['count'], specialization: item['specialization']));
          }
          printLog(
              "doctorSpecializationsCount", doctorSpecializationsCount.length);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 3,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: const DecorationImage(
                      image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Welcome Back",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        SizedBox(width: 5),
                        Text("|",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        SizedBox(width: 5),
                        Text("Edit Profile",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                        SizedBox(width: 5),
                        Text("60%",
                            style: TextStyle(
                                color: Color(colorD70404), fontSize: 12)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Seshu Saragadam",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color(colorD70404), fontSize: 12)),
                        SizedBox(width: 5),
                        Text("MBBS FRCS",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Image.asset(notificationsIcon),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: Container(
            color: Colors.black,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                ),
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24, top: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 10),
                              FutureBuilder<List<StatesModel>>(
                                future: statesList,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    var lStatesList = snapshot.data;
                                    lStatesList?.sort((a, b) =>
                                        a.stateName.compareTo(b.stateName));
                                    return DropdownButtonFormField(
                                        isExpanded: true,
                                        hint: Text(selectState),
                                        items: lStatesList?.map((item) {
                                          return DropdownMenuItem(
                                            value: item.stateName,
                                            child: Text(item.stateName),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectState = value!;
                                            getCities();
                                          });
                                        },
                                        // Initial Value
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: borderBg,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 40,
                                                    right: 40,
                                                    bottom: 15,
                                                    top: 15),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            border: OutlineInputBorder(
                                              // <--- this line
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // <--- this line
                                            )));
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField(
                                  hint: const Text("Select City"),
                                  items: citiesList.map((item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                  onChanged: (newVal) {
                                    setState(() {
                                      selectCity = newVal.toString();
                                      getDoctorsCount();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: borderBg,
                                    contentPadding: const EdgeInsets.only(
                                        left: 40,
                                        right: 40,
                                        bottom: 15,
                                        top: 15),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                      // <--- this line
                                      borderRadius: BorderRadius.circular(
                                          10), // <--- this line
                                    ),
                                  ),
                                  isExpanded: true,
                                  value: selectCity),
                              const SizedBox(height: 20),
                              GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: (1 / 0.8),
                                mainAxisSpacing: 8.0,
                                physics: const NeverScrollableScrollPhysics(),
                                // spacing between rows
                                crossAxisSpacing: 8.0,
                                shrinkWrap: true,
                                children: List.generate(
                                    doctorSpecializationsCount.length, (index) {
                                  return displayRowItem(
                                      doctorSpecializationsCount[index]);
                                }),
                              ),
                              const SizedBox(height: 20)
                            ]))))));
  }

  void searchQuery(String query) {
    if (query.isEmpty) {
      _doctorsList.clear();
      isVisible = _doctorsList.isNotEmpty;
      setState(() {});
      return;
    }
    query = query.toLowerCase();
    //submitDetails(query);
    setState(() {});
  }
}

Widget displayRowItem(DoctorsCountModel specializationDetails) {
  return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 6.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(neurologyIcon),
            getHeaderLabelText(
                specializationDetails.specialization, Colors.black),
            getHeaderLabelText2(
                "${specializationDetails.count} Doctors", Colors.black38)
          ],
        ),
      ));
}

Text getHeaderLabelText(String labelName, Color textColor) {
  return Text(labelName,
      style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontFamily: poppins,
          fontWeight: FontWeight.w500));
}

Text getHeaderLabelText2(String labelName, Color textColor) {
  return Text(labelName,
      style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontFamily: poppins,
          fontWeight: FontWeight.w300));
}
