import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomDropdown extends StatefulWidget {
  final String dropdownName;
  final List<String> options;
  final String selectedOption;
  final Function(String) onChanged;
  final String hintTextOption;

  const CustomDropdown(
      {super.key,
      required this.dropdownName,
      required this.options,
      required this.selectedOption,
      required this.onChanged,
      required this.hintTextOption});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.dropdownName,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: borderBg,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.selectedOption,
              onChanged: (newValue) {
                setState(() {
                  widget.onChanged(newValue!);
                });
              },
              isExpanded: true,
              dropdownColor: Colors.grey[200],
              selectedItemBuilder: (BuildContext context) {
                return widget.options.map((String value) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList();
              },
              items:
                  widget.options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
