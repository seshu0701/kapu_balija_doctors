import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kapu_balija_doctors/utils/constants.dart';

import 'doctors_model.dart';
import 'services/helper.dart';

class SearchDoctorsScreen extends StatefulWidget {
  const SearchDoctorsScreen({super.key});

  @override
  State createState() => _SearchDoctorsScreen();
}

class _SearchDoctorsScreen extends State<SearchDoctorsScreen> {
  List<DoctorDetails> _doctorsList = <DoctorDetails>[];
  TextEditingController txtQuery = TextEditingController();
  bool isVisible = false;

  void search(String query) {
    if (query.isEmpty) {
      _doctorsList.clear();
      isVisible = _doctorsList.isNotEmpty;
      setState(() {});
      return;
    }
    query = query.toLowerCase();
    submitDetails(query);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 30),
              TextFormField(
                controller: txtQuery,
                onFieldSubmitted: (val) {
                  search(val);
                },
                decoration: InputDecoration(
                  hintText: "Search Doctors",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      txtQuery.text = '';
                      search(txtQuery.text);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: const Text(
                        "Dr Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: const Text(
                        "Speciality",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: const Text(
                        "Phone",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: const Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: const Text(
                        "Education",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14.0),
                      )),
                ),
              ],
            )),
        Visibility(
            visible: _doctorsList.isEmpty,
            child: const Text(
              "No Doctors Found",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.0),
            )),
        const SizedBox(height: 15),
        _listView(_doctorsList),
      ]),
    );
  }

  void submitDetails(String search) async {
    try {
      final url = Uri.parse("${baseUrl}api/users/search");
      Response response = await post(url, body: {
        'search': search,
      });

      if (response.statusCode == 200) {
        //var data = jsonDecode(response.body.toString());
        final List body = json.decode(response.body);
        _doctorsList = body.map((e) => DoctorDetails.fromJson(e)).toList();
        setState(() {
          _doctorsList;
        });
      } else {
        showDialog(response.body);
      }
    } catch (e) {
      showDialog(e.toString());
    }
  }

  Widget _listView(doctorsList) {
    return Expanded(
      child: ListView.builder(
          itemCount: doctorsList.length,
          itemBuilder: (context, index) {
            var doctor = doctorsList[index];
            var doctorName = doctor.firstName +
                " " +
                doctor.middleName +
                " " +
                doctor.lastName;
            return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    Row(children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                            constraints: const BoxConstraints(minHeight: 60),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              doctorName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 13.0),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            constraints: const BoxConstraints(minHeight: 60),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              doctor.speciality,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 13.0),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            constraints: const BoxConstraints(minHeight: 60),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              doctor.phone.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 13.0),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            constraints: const BoxConstraints(minHeight: 60),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(3),
                            child: Text(
                              doctor.address,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 13.0),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            constraints: const BoxConstraints(minHeight: 60),
                            padding: const EdgeInsets.all(3),
                            alignment: Alignment.center,
                            child: Text(
                              doctor.education,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 12.0),
                            )),
                      ),
                    ]),
                    const Divider(
                      height: 10,
                      color: Colors.green,
                      thickness: 1,
                      indent: 2,
                      endIndent: 2,
                    ),
                  ],
                ));
          }),
    );
  }

  void showDialog(String message) {
    showAlertDialog(context, "Message", message);
  }
}
