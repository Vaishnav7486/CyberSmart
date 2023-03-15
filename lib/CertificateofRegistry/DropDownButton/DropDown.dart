import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({
    super.key,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _chosenValue;
  String? value1;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (_chosenValue == "NO") ? Color(0XFFFCF3F2) : Color(0xffDDE2E5),
      ),
      height: 72,
      width: 375,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Valid",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: (_chosenValue == "NO")
                    ? Color.fromARGB(255, 255, 26, 1)
                    : Color(0xff5E6366),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
        subtitle: DropdownButton<String>(
          value: _chosenValue,

          //elevation: 5,
          style: TextStyle(color: Color(0xff5E6366)),

          items: <String>[
            'Please Select',
            'YES',
            'NO',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(
            "Please Select",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 2, 3),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          onChanged: (String? value) {
            setState(() {
              _chosenValue = value!;

              print(_chosenValue);
            });
          },
        ),
      ),
    ));
  }
}
