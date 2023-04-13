import 'dart:convert';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:cybersmart/helper/imageDatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// class UploadImageClass extends StatefulWidget {
//   UploadImageClass({super.key, required this.selectedForm});
//   String selectedForm;

//   @override
//   State<UploadImageClass> createState() => _UploadImageClassState();
// }

// class _UploadImageClassState extends State<UploadImageClass> {
//   List<String> _imageList = [];

//   Future<void> _pickImages() async {
//     List<XFile>? images = await ImagePicker().pickMultiImage();
//     if (images != null) {
//       List<String> base64Images = [];
//       for (XFile image in images) {
//         final bytes = await image.readAsBytes();
//         base64Images.add(base64Encode(bytes));
//       }
//       setState(() {
//         _imageList.addAll(base64Images);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//             onPressed: () {
//               _pickImages();
//             },
//             child: Text("select image")),
//         ElevatedButton(onPressed: () {}, child: Text("prinnt count")),
//         GridView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//           ),
//           itemCount: _imageList.length,
//           itemBuilder: (BuildContext context, int index) {
//             final imageBytes = base64Decode(_imageList[index]);
//             return Image.memory(
//               imageBytes,
//               fit: BoxFit.cover,
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

///
///
///
///
///

// class ImageInfo {
//   final int id;
//   final String filename;
//   final String filetype;
//   final bool globalAttachments;
//   final String name;
//   final String base64img;
//   final String pointId;
//   final String remarkOfFile;
//   final String sectionId;

//   ImageInfo({
//     required this.id,
//     required this.filename,
//     required this.filetype,
//     required this.globalAttachments,
//     required this.name,
//     required this.base64img,
//     required this.pointId,
//     required this.remarkOfFile,
//     required this.sectionId,
//   });

//   factory ImageInfo.fromJson(Map<String, dynamic> json) {
//     return ImageInfo(
//       id: json['id'],
//       filename: json['details']['filename'],
//       filetype: json['details']['filetype'],
//       globalAttachments: json['details']['globalAttachments'],
//       name: json['details']['name'],
//       base64img: json['details']['base64img'],
//       pointId: json['details']['PointId'],
//       remarkOfFile: json['details']['RemarkofFile'],
//       sectionId: json['details']['SectionId'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'details': {
//           'filename': filename,
//           'filetype': filetype,
//           'globalAttachments': globalAttachments,
//           'name': name,
//           'base64img': base64img,
//           'PointId': pointId,
//           'RemarkofFile': remarkOfFile,
//           'SectionId': sectionId,
//         },
//       };
// }

// class UploadImageClass extends StatefulWidget {
//   UploadImageClass({super.key, required this.selectedForm});
//   String selectedForm;

//   @override
//   State<UploadImageClass> createState() => _UploadImageClassState();
// }

// class _UploadImageClassState extends State<UploadImageClass> {
//   List<ImageInfo> _imageList = [];

//   ///
//   ///
//   ///
//   Future<void> _pickImages() async {
//     List<XFile>? images = await ImagePicker().pickMultiImage();
//     if (images != null) {
//       List<ImageInfo> imageInfos = [];
//       for (XFile image in images) {
//         final bytes = await image.readAsBytes();
//         final base64Image = base64Encode(bytes);
//         final filename = image.name;
//         final filetype = 'image/${image.path.split('.').last}';
//         final imageInfo = ImageInfo(
//           id: 2,
//           filename: filename,
//           filetype: filetype,
//           globalAttachments: true,
//           name: 'tedst',
//           base64img: base64Image,
//           pointId: '1',
//           remarkOfFile: 'ksksks',
//           sectionId: '1',
//         );
//         imageInfos.add(imageInfo);
//       }
//       setState(() {
//         _imageList.addAll(imageInfos);
//       });
//     }
//   }

//   ///
//   ///
//   ///

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//             onPressed: () {
//               _pickImages();
//             },
//             child: Text("select image")),
//         ElevatedButton(
//             onPressed: () {
//               // print(object);
//             },
//             child: Text("prinnt count")),
//         GridView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, childAspectRatio: 0.8),
//           itemCount: _imageList.length,
//           itemBuilder: (BuildContext context, int index) {
//             final imageInfo = _imageList[index];
//             final imageBytes = base64Decode(imageInfo.base64img);

//             return Column(
//               children: [
//                 Container(
//                   height: 120,
//                   child: Image.memory(
//                     imageBytes,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Text(imageInfo.filename),
//               ],
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

////
///
///
///
///
///
/// v3

class UploadImageClass extends StatefulWidget {
  UploadImageClass({super.key, required this.selectedForm});
  String selectedForm;

  @override
  State<UploadImageClass> createState() => _UploadImageClassState();
}

class _UploadImageClassState extends State<UploadImageClass> {
  List<Map<String, String>> imagesList = [];
  List<Map<String, dynamic>> imageJsonList = [];

  Future<void> pickImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();

    if (selectedImages != Null) {
      for (XFile image in selectedImages) {
        final bytes = await File(image.path).readAsBytes();
        final String base64Image = base64Encode(bytes);
        final String fileType = image.name.split('.').last;
        final Map<String, dynamic> imageInfo = {
          "id": imagesList.length + 1, // assign an ID to each image
          "details": {
            "filename": image.name,
            "filetype": fileType,
            "globalAttachments": true,
            "name": "tedst",
            "PointId": "1",
            "RemarkofFile": "ksksks",
            "SectionId": "1"
          }
        };
        final Map<String, String> imageData = {
          "imageName": image.name,
          "imageBase64": base64Image,
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
            child: Text("select image")),
        ElevatedButton(
            onPressed: () {
              print(imageJsonList);
              // print(imagesList);
            },
            child: Text("prinnt count")),
        ElevatedButton(
            onPressed: () {
              // print(imagesList);
              // print(imagesList[1]["imageBase64"]);
              insertImageData(imagesList);
              print("button pressed");
            },
            child: Text("Add images to database")),
        ElevatedButton(
            onPressed: () {
              printImageData();
            },
            child: Text("Print contents of image database ")),
        ElevatedButton(
            onPressed: () {
              clearImageData();
            },
            child: Text("delete all images from database ")),
        ElevatedButton(
            onPressed: () {
              // ImageUploadFunctions.uploadImageData();
              ImageUploadFunctions.uploadAsampleImagetoDatabase();
            },
            child: Text("Upload image data to cloud ")),
        ElevatedButton(
            onPressed: () {
              printAllData();
            },
            child: Text("Print all data from database in json")),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.8),
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
                        base64Decode(image['imageBase64']!),
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
