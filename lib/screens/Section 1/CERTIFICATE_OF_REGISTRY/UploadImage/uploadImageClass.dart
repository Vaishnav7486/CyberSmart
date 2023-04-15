import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:cybersmart/helper/imageDatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UploadImageClass extends StatefulWidget {
  UploadImageClass({super.key, required this.selectedForm});
  String selectedForm;

  @override
  State<UploadImageClass> createState() => _UploadImageClassState();
}

class _UploadImageClassState extends State<UploadImageClass> {
  List<Map<String, Object>> imagesList = [];
  List<Map<String, dynamic>> imageJsonList = [];

  Future<void> pickImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();

    if (selectedImages != null) {
      for (XFile image in selectedImages) {
        final bytes = await File(image.path).readAsBytes();
        final Map<String, dynamic> imageInfo = {
          "id": imagesList.length + 1, // assign an ID to each image
          "details": {
            "filename": image.name,
            "filetype": image.name.split('.').last,
            "globalAttachments": true,
            "name": "tedst",
            "PointId": "1",
            "RemarkofFile": "ksksks",
            "SectionId": "1"
          }
        };
        final Map<String, Object> imageData = {
          "imageName": image.name,
          "imageBlob": bytes,
        };

        setState(() {
          imagesList.add(imageData);
          imageJsonList.add(imageInfo);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            pickImages();
          },
          child: Text("Select Image"),
        ),
        ElevatedButton(
          onPressed: () {
            print("Image JSON List");
            print(imageJsonList);
            print("Image Only List");
            print(imagesList);
          },
          child: Text("Print Count"),
        ),
        ElevatedButton(
          onPressed: () async {
            ImageDatabaseHelper.printImagesFromDatabase();
          },
          child: Text("Print Contents of Database"),
        ),
        ElevatedButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShowImagesPage()),
            );
          },
          child: Text("Show images in database"),
        ),
        ElevatedButton(
          onPressed: () async {
            await ImageDatabaseHelper.saveImagesToDatabase(imagesList);
          },
          child: Text("Insert the images to database"),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
          ),
          itemCount: imagesList.length,
          itemBuilder: (BuildContext context, int index) {
            final image = imagesList[index];
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 120,
                      child: Image.memory(
                        image['imageBlob'] as Uint8List,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(image["imageName"] as String),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        imagesList.removeAt(index);
                        imageJsonList.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

///
///
///
///
///

class ShowImagesPage extends StatefulWidget {
  @override
  _ShowImagesPageState createState() => _ShowImagesPageState();
}

class _ShowImagesPageState extends State<ShowImagesPage> {
  List<Uint8List> unit8listvariable = [];
  List<Uint8List> unit8listvariable_helper = [];
  List<Image> imageList = [];
  List<Image> imageListHelper = [];
  // List ImageMap;
  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  fetchDataFromDatabase() async {
    unit8listvariable_helper = await ImageDatabaseHelper.getAllImages();
    imageListHelper =
        unit8listvariable_helper.map((e) => Image.memory(e)).toList();

    setState(() {
      unit8listvariable = unit8listvariable_helper;
      imageList = imageListHelper;
    });
    print("printing from the init state ");
    print(unit8listvariable);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Images'),
        ),
        body: SingleChildScrollView(
          // child: FutureBuilder<List<String>>(
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (snapshot.hasError) {
          //       return Center(child: Text('Error: ${snapshot.error}'));
          //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //       return Center(child: Text('No images found'));
          //     } else {
          // return

          ///
          ///
          ///
          /// this
          //   child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          ///
          ///
          ///
          ///

          // itemCount: snapshot.data!.length,
          // itemBuilder: (context, index) {
          //   return Image.asset(snapshot.data![index]);
          // },

          ///
          ///
          ///
          ///this

          //   itemCount: imageList.length,
          //   itemBuilder: (context, index) {
          //     Uint8List bytes =
          //         base64Decode(unit8listvariable_helper[index] as String);
          //     return Image.memory(bytes);
          //   },
          // )
          //     }
          //   },
          // ),
          // ),
          // child: GridView.builder(
          //     physics: NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: 1,
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          //     itemBuilder: (context, index) {
          //       return Container(
          //           // child: Image.asset(),
          //           );
          //     }),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: imageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return imageList[index];
            },
          ),
        ));
  }
}
