import 'package:flutter/material.dart';
import 'package:kapu_balija_doctors/utils/constants.dart';
import 'package:kapu_balija_doctors/utils/images.dart';

import 'doctors_model.dart';
import 'models/Params.dart';

class SearchDoctorsHomeScreen extends StatefulWidget {
  const SearchDoctorsHomeScreen({super.key});

  @override
  State createState() => _SearchDoctorsHomeScreen();
}

class _SearchDoctorsHomeScreen extends State<SearchDoctorsHomeScreen> {
  final List<DoctorDetails> _doctorsList = <DoctorDetails>[];
  TextEditingController txtQuery = TextEditingController();
  bool isVisible = false;

/*  List<Specialization> specializationList = const <Specialization>[
    Specialization(title: 'Neurology', count: 20, icon: neurologyIcon),
    Specialization(title: 'Medicine', count: 50, icon: medicineIcon),
    Specialization(title: 'Cardiology', count: 5, icon: cardiologyIcon),
    Specialization(title: 'Orthopedics', count: 2, icon: orthopedicsIcon),
    Specialization(title: 'Paediatrics', count: 10, icon: paediatricsIcon),
    Specialization(title: 'Surgery', count: 20, icon: surgeryIcon),
    Specialization(title: 'OBG', count: 1, icon: obgIcon),
    Specialization(title: 'Pulmonology', count: 8, icon: pulmonologyIcon),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
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
                              SizedBox(
                                height: 50,
                                child: TextFormField(
                                  controller: txtQuery,
                                  onFieldSubmitted: (val) {
                                    searchQuery(val);
                                  },
                                  decoration: InputDecoration(
                                    hintText: search,
                                    filled: true,
                                    fillColor: borderBg,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    prefixIcon: Image.asset(searchIcon),
                                    suffixIcon: Image.asset(filterIcon),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              /*SizedBox(
                                height: 60,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(rectangleFrame),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 0, 0, 0),
                                                  child: Container(
                                                    width: 35,
                                                    height: 35,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17),
                                                        color: Colors.white),
                                                    child: const Text('B'),
                                                  )),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: getHeaderLabelText(
                                                      referred, Colors.white))
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 0, 0, 0),
                                                  child: Container(
                                                    width: 35,
                                                    height: 35,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17),
                                                        color: Colors.white),
                                                    child: const Text('25'),
                                                  )),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 0, 0),
                                                  child: getHeaderLabelText(
                                                      received, Colors.white))
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),*/
                              const SizedBox(height: 20),
                              GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: (1 / 0.8),
                                mainAxisSpacing: 8.0,
                                physics: const NeverScrollableScrollPhysics(),
                                // spacing between rows
                                crossAxisSpacing: 8.0,
                                shrinkWrap: true,
                                /*children: List.generate(specializationList.length, (index) {
                                  return displayRowItem(specializationList[index]);
                                }),*/
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

Widget displayRowItem(Specialization specializationDetails) {
  return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 6.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(specializationDetails.icon),
            getHeaderLabelText(specializationDetails.title, Colors.black),
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
