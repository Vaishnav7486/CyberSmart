import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Const/Colors.dart';

class Certificateofregistry extends StatefulWidget {
  const Certificateofregistry({super.key});

  @override
  State<Certificateofregistry> createState() => _CertificateofregistryState();
}

class _CertificateofregistryState extends State<Certificateofregistry> {
  late TextEditingController issuedateController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  final TextEditingController _Remark_Textcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    expiryDateController.text = "";
    issuedateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffDDE2E5)),
            height: 58,
            width: 375,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: TextStyle(color: CS_TextleColor),
                controller: issuedateController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xff000000),
                  ),
                  labelText: "Issue date",
                  labelStyle: TextStyle(
                    color: Color(0xff000000), //<-- SEE HERE
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary:
                                  CS_ButtonColor, // header background color
                              onPrimary: Colors.white, // header text color
                              onSurface: Color.fromARGB(
                                  255, 38, 102, 71), // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: CS_ButtonColor, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      });
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat("dd/MM/yyyy").format(pickedDate);
                    setState(() {
                      issuedateController.text = formattedDate.toString();
                    });
                  } else {}
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffDDE2E5)),
            height: 58,
            width: 375,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: TextStyle(color: CS_TextleColor),
                controller: expiryDateController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xff000000),
                  ),
                  labelText: "Expiry Date",
                  labelStyle: TextStyle(
                    color: Color(0xff000000), //<-- SEE HERE
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary:
                                  CS_ButtonColor, // header background color
                              onPrimary: Colors.white, // header text color
                              onSurface: Color.fromARGB(
                                  255, 38, 102, 71), // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: CS_ButtonColor, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      });
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat("dd/MM/yyyy").format(pickedDate);
                    setState(() {
                      expiryDateController.text = formattedDate.toString();
                    });
                  } else {
                    print("Not selected");
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: (_Remark_Textcontroller.text == "")
                    ? Color.fromARGB(255, 56, 56, 56)
                    : (_Remark_Textcontroller.text == "")
                        ? Color.fromARGB(255, 240, 24, 0)
                        : Color.fromARGB(255, 3, 180, 77),
              ),
            ),
            height: 136,
            width: 375,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _Remark_Textcontroller,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Remarks',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 56, 56, 56)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
