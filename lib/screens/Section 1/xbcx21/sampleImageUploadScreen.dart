import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SampleImageUploadScreenXB1 extends StatefulWidget {
  const SampleImageUploadScreenXB1({super.key});

  @override
  State<SampleImageUploadScreenXB1> createState() =>
      _SampleImageUploadScreenXB1State();
}

class _SampleImageUploadScreenXB1State
    extends State<SampleImageUploadScreenXB1> {
  List<File> imageStorage = [];
  List<AssetImage> imagePicker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
