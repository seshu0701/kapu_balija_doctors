import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kapu_balija_doctors/models/search_data.dart';
import 'package:kapu_balija_doctors/utils/constants.dart';

import 'services/helper.dart';

class SearchDoctorsScreen extends StatefulWidget {
  const SearchDoctorsScreen({super.key});

  @override
  State createState() => _SearchDoctorsScreen();
}

class _SearchDoctorsScreen extends State<SearchDoctorsScreen> {
  final TextEditingController searchController = TextEditingController();
  Icon cusIcon =const  Icon(Icons.search);
  Widget cusSearchBar=const Text("Search Doctors",style: TextStyle(color: Colors.white),);
  List<SearchData> searchData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: cusSearchBar,
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              setState(() {
                if(cusIcon.icon == Icons.search){
                  cusIcon = const Icon(Icons.cancel);
                  cusSearchBar = TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.search,

                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.white),

                      border: InputBorder.none,
                    ),
                    onSubmitted: (value){
                      debugPrint(value);
                      submitDetails();

                    },
                  );
                }
                else{
                  cusIcon = const Icon(Icons.search);
                  cusSearchBar =  const Text("Search Doctors",style:  TextStyle(fontSize: 16, color: Colors.white),);

                }
              });
            }, icon: cusIcon,),
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10,top: 20),
        child: ListView.builder(
          itemCount: searchData.length,
            itemBuilder: (context,index){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(searchData[index].firstName.toString()),
            ],
          );
        }),
      ),
        );
  }

  void submitDetails() async {
    try {
      final uri = Uri.parse("${baseUrl}api/users/search");
      Response response = await post(uri, body: {
        'search': searchController.text,
      });

      if (response.statusCode == 200) {
        searchController.clear();
        setState(() {
          List jsonResponse = json.decode(response.body);
           searchData = jsonResponse.map((data) => SearchData.fromJson(data)).toList();


        });
      } else {
        showDialog(response.body);
      }
    } catch (e) {
      showDialog(e.toString());
    }
  }

  void showDialog(String message) {
    showAlertDialog(context, "Message", message);
  }
}
