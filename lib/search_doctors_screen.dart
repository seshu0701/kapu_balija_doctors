import 'package:flutter/material.dart';

import 'services/helper.dart';

class SearchDoctorsScreen extends StatefulWidget {
  const SearchDoctorsScreen({super.key});

  @override
  State createState() => _SearchDoctorsScreen();
}

class _SearchDoctorsScreen extends State<SearchDoctorsScreen> {
  final GlobalKey<FormState> _searchDoctorsKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          iconTheme: IconThemeData(
              color: isDarkMode(context) ? Colors.white : Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Search Doctors"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          key: _searchDoctorsKey,
          children: [
            Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, right: 24.0, left: 24.0),
                child: SearchBar(
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Change brightness mode',
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.wb_sunny_outlined),
                          selectedIcon: const Icon(Icons.close),
                        ),
                      )
                    ])),
          ],
        ));
  }

  void submitDetails() async {}
}
