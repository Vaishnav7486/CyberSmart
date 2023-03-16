import 'package:flutter/material.dart';

import '../Const/Colors.dart';
import 'Add to global/addtoglobal.dart';
import 'Certificate of Registry form/CertificateofRegistryform.dart';
import 'DropDownButton/DropDown.dart';
import 'UploadImage/uploadimage.dart';

class CertificateofRegistryForm extends StatefulWidget {
  const CertificateofRegistryForm({super.key});

  @override
  State<CertificateofRegistryForm> createState() =>
      _CertificateofRegistryFormState();
}

class _CertificateofRegistryFormState extends State<CertificateofRegistryForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CS_BackgroundColor,
      appBar: AppBar(
        backgroundColor: CS_BackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: CS_TextleColor)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, top: 15, bottom: 15),
              child: Text(
                "CERTIFICATE OF REGISTRY",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: CS_BodyContainerColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  DropDown(),
                  SizedBox(
                    height: 25,
                  ),
                  Addtoremark(),
                  SizedBox(
                    height: 40,
                  ),
                  Uploadimage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
