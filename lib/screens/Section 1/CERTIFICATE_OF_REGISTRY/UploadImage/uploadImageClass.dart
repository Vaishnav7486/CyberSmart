import 'dart:convert';
import 'dart:typed_data';
import 'package:cybersmart/helper/database_functions.dart';
import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:cybersmart/services/api_operations.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:cybersmart/helper/imageDatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UploadImageClass extends StatefulWidget {
  UploadImageClass(
      {super.key,
      required this.selectedForm,
      // required this.imageListParam,
      required this.section1instance});
  String selectedForm;

  Section1Modelsample1 section1instance;

  @override
  State<UploadImageClass> createState() => _UploadImageClassState();
}

class _UploadImageClassState extends State<UploadImageClass> {
  late List<Attachment> imageListParam = widget.section1instance
      .presurveyInfo[0].registryRequirements[0].details.attachments;
  List<Map<String, Object>> images_List = [];
  List<Map<String, Object>> images_ListHelper = [];
  List<Image> imageList = [];
  List<Image> imageListHelper = [];
  List<Attachment> imageJsonList = [];
  List<Uint8List> unit8listvariable = [];
  List<Uint8List> unit8listvariable_helper = [];
  static List<String> imageNameList = [];

  // List<ImageData> imageDataList = [];

  Future<void> pickImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();

    if (selectedImages != null) {
      for (XFile image in selectedImages) {
        final bytes = await File(image.path).readAsBytes();
        // final Map<String, dynamic> imageInfo = {
        //   "id": images_List.length + 1, // assign an ID to each image
        //   "details": {
        //     "filename": image.name,
        //     "filetype": image.name.split('.').last,
        //     "globalAttachments": true,
        //     "name": "tedst",
        //     "PointId": "1",
        //     "RemarkofFile": "ksksks",
        //     "SectionId": "1"
        //   }
        // };
        Attachment attachmentInstance = Attachment(
            details: AttachmentDetails(
                filename: image.name,
                filetype: image.name.split('.').last,
                globalAttachments: true,
                name: "name of image",
                pointId: "1",
                remarkofFile: "remarks of image",
                sectionId: "12"),
            id: imageList.length + 1);
        final Map<String, Object> imageData = {
          "imageName": image.name,
          "imageBlob": bytes,
        };

        setState(() {
          images_List.add(imageData);
          imageJsonList.add(attachmentInstance);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      imageListParam = widget.section1instance.presurveyInfo[0]
          .registryRequirements[0].details.attachments;
    });

    if (imageListParam.length > 0) {
      setState(() {
        imageNameList = getImageNamefromParamList();
      });
      print("image list param length is greater than 0");
      // functionToAssignNamIMageNameAndBlob();
    }
    print("printing image name list contents");
    print(imageNameList);
  }

  // functionToAssignNamIMageNameAndBlob() async {
  //   List<Map<String, dynamic>>? imageMap_NameAndBlob;
  //   setState(() async {
  //     // imageMap_NameAndBlob =
  //     //     await ImageDatabaseHelper.returnSelectedImageBlobAndName(
  //     //         imageNameList);
  //     print("printing map of blob and name returned from db");
  //     print(imageMap_NameAndBlob);
  //   });
  //   setState(() {
  //     imageDataList = parseImageDataList(imageMap_NameAndBlob!);
  //   });
  // }

  // List<ImageNameAndBlob> parseImageDataList(List<Map<String, dynamic>> imageMapList) {
    // return imageMapList
    //     .map((imageMap) => ImageNameAndBlob(
    //           imageName: imageMap['imageName'],
    //           imageBlob: unit8List.from(imageMap['imageBlob']),
    //         ))
    //     .toList();
  // }

  getImageNamefromParamList() {
    print("imagelist param length");
    print(imageListParam.length);
    print(imageListParam[0].details.filename);
    for (var i = 0; i < imageListParam.length; i++) {
      setState(() {
        imageNameList.add(imageListParam[i].details.filename);
      });
    }

    return imageNameList;
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

  clearTheList() {
    setState(() {
      imageJsonList.clear();
      images_List.clear();
      imageList.clear();
      imageJsonList.cast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            pickImages();
            setState(() {});
          },
          child: Text("Select Image"),
        ),

        imageListParam.length == 0
            ? Text("Nothing in attatchments")
            : GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: imageNameList.length,
                itemBuilder: (context, index) {
                  // final Uint8List bytes =
                      // Uint8List.fromList(imageDataList[index].imageBlob);
                  // return Image.memory(bytes);
                }),
        ElevatedButton(
            onPressed: () {
              print(imageJsonList);
              // print(jsonde)
              print(jsonEncode(imageJsonList));
            },
            child: Text("show what is in the list ")),

        ///
        ///
        ///
        ///

        ///
        ///
        ///
        ///

        ///
        ///
        ///
        ///
        // ElevatedButton(
        //   onPressed: () {
        //     print("Image JSON List");
        //     print(imageJsonList);
        //     // print("Image Only List");
        //     // print(imagesList);
        //   },
        //   child: Text("Print contents of detail json"),
        // ),
        // ElevatedButton(
        //   onPressed: () async {
        //     ImageDatabaseHelper.printImagesFromDatabase();
        //   },
        //   child: Text("Print Contents of Database"),
        // ),
        // ElevatedButton(
        //   onPressed: () async {
        //     await ImageDatabaseHelper.deleteAllImagesFromDatabase();
        //     await clearTheList();
        //     fetchDataFromDatabase();
        //   },
        //   child: Text("Delete all images in database"),
        // ),
        ElevatedButton(
          onPressed: () async {
            // await ImageDatabaseHelper.deleteAllImagesFromDatabase();
            // await clearTheList();
            // fetchDataFromDatabase();
            setState(() {
              imageNameList.clear();
            });
          },
          child: Text("Delete image names from list - screen"),
        ),
        // ElevatedButton(
        //   onPressed: () async {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => ShowImagesPage()),
        //     );
        //   },
        //   child: Text("Show images in database"),
        // ),
        ElevatedButton(
          onPressed: () async {
            // await ImageDatabaseHelper.saveImagesToDatabase(images_List);
            // imageJsonList
            imageListParam.addAll(imageJsonList);
            String message_updationOfDataToDatabase =
                await DBFunctions.saveAndUpdateInstanceOfSection1ToDatabase(
                    widget.section1instance);
            print(message_updationOfDataToDatabase);
            if (message_updationOfDataToDatabase == "success") {
              Fluttertoast.showToast(msg: "values updated to database");
            } else if (message_updationOfDataToDatabase == "failed") {
              Fluttertoast.showToast(
                  msg: "failed to update values to database");
            }
            fetchDataFromDatabase();
          },
          child: Text("save images to db"),
        ),
        // SizedBox(height: 40),
        // ElevatedButton(
        //   onPressed: () async {
        //     String imageJson = await ImageDatabaseHelper.getAllImagesInJson();
        //     print(imageJson);
        //   },
        //   child: Text("print contents in json"),
        // ),
        // SizedBox(height: 40),
        // SizedBox(height: 40),
        // ElevatedButton(
        //   onPressed: () async {
        //     ApiOperations.syncImagesToCloud();
        //   },
        //   child: Text("sync images to cloud"),
        // ),

        ///
        ///
        ///
        ///

        ///
        ///
        ///
        ///

        ///
        ///
        ///
        ///
        SizedBox(height: 40),

        ///
        ///
        ///
        ///
        ///uncomment this this shows the images selected presently

        //
        // GridView.builder(
        //   physics: NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     childAspectRatio: 0.8,
        //   ),
        //   itemCount: images_List.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final image = images_List[index];
        //     return Stack(
        //       children: [
        //         Column(
        //           children: [
        //             Container(
        //               height: 120,
        //               child: Image.memory(
        //                 image['imageBlob'] as Uint8List,
        //                 fit: BoxFit.cover,
        //               ),
        //             ),
        //             Text(image["imageName"] as String),
        //           ],
        //         ),
        //         Positioned(
        //           top: 0,
        //           right: 0,
        //           child: IconButton(
        //             onPressed: () {
        //               setState(() {
        //                 images_List.removeAt(index);
        //                 imageJsonList.removeAt(index);
        //               });
        //             },
        //             icon: Icon(Icons.delete),
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // ),
        imageList.length == 0
            ? Text("empty")
            : GridView.builder(
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
          child: imageList.length == 0
              ? Text("empty")
              : GridView.builder(
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

// class ImageData {
//   String imageName;
//   List<int> imageBlob;

//   ImageData({required this.imageName, required this.imageBlob});
// }
