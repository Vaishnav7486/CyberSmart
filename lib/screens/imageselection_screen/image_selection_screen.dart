import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cybersmart/screens/Section 1/CERTIFICATE_OF_REGISTRY/UploadImage/uploadImageClass.dart';
// import 'package:cyberscreens\Section 1\CERTIFICATE_OF_REGISTRY\UploadImage\uploadImageClass.dart';

class ImageSelectinoScreen extends StatefulWidget {
  const ImageSelectinoScreen({super.key});

  @override
  State<ImageSelectinoScreen> createState() => _ImageSelectinoScreenState();
}

class _ImageSelectinoScreenState extends State<ImageSelectinoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: UploadImageClass(selectedForm: "section1")),
      ),
    );
  }
}
