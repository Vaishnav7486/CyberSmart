import 'package:flutter/material.dart';

import '../Const/Colors.dart';
import 'DropDownButton/DropDown.dart';

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
      body: Container(
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
          children: [
            SizedBox(
              height: 25,
            ),
            DropDown()
          ],
        ),
      ),
    );
  }
}
