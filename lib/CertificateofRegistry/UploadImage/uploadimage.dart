import 'package:cybersmart/Const/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../imagepicker/imagepicker.dart';

class Uploadimage extends StatefulWidget {
  const Uploadimage({super.key});

  @override
  State<Uploadimage> createState() => _UploadimageState();
}

class _UploadimageState extends State<Uploadimage> {
  String selectedImagePath = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 44,
            width: 180,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CS_BodyContainerColor,
                    foregroundColor: Color(0xff4AA080)),
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 150,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 58,
          width: 375,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4AA080),
                foregroundColor: CS_BodyContainerColor),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Imagepickercontainer()));
            },
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
