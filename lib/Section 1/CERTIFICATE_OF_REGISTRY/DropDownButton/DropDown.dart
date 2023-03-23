import 'package:flutter/material.dart';
import '../../../Const/Colors.dart';
import '../Certificate of Registry form/CertificateofRegistryform.dart';

class DropDown extends StatefulWidget {
  DropDown({
    super.key,
  });

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (_chosenValue == null || _chosenValue == 'Please Select')
                  ? Color(0xffDDE2E5)
                  : (_chosenValue == 'NO')
                      ? Color(0xffFCF3F2)
                      : Color(0xffF0F9F6),
            ),
            height: 72,
            width: 375,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Valid",
                  style: TextStyle(
                      color: (_chosenValue == null ||
                              _chosenValue == 'Please Select')
                          ? Color.fromARGB(255, 56, 56, 56)
                          : (_chosenValue == 'NO')
                              ? Color.fromARGB(255, 240, 24, 0)
                              : Color.fromARGB(255, 3, 180, 77),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              subtitle: DropdownButton<String>(
                icon: SizedBox(),
                underline: SizedBox(),
                value: _chosenValue,
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
                  style: CS_Font,
                ),
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value!;
                  });
                },
              ),
              trailing: Icon(
                Icons.expand_more,
                size: 35,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Certificateofregistry()
      ],
    );
  }
}
