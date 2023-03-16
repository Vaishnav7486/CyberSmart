import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Const/Colors.dart';
import '../Add to global/addtoglobal.dart';
import '../UploadImage/uploadimage.dart';

class Certificateofregistry extends StatefulWidget {
  const Certificateofregistry({super.key});

  @override
  State<Certificateofregistry> createState() => _CertificateofregistryState();
}

class _CertificateofregistryState extends State<Certificateofregistry> {
  TextEditingController issuedateController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  final TextEditingController _Textcontroller = TextEditingController();

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
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat("dd/MM/yyyy").format(pickedDate);
                    setState(() {
                      issuedateController.text = formattedDate.toString();
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
                  );
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
              border: Border.all(),
            ),
            height: 136,
            width: 375,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _Textcontroller,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Remarks',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
