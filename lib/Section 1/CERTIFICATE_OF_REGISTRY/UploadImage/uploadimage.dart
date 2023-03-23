import 'dart:io';

import 'package:cybersmart/Const/Colors.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class Uploadimage extends StatefulWidget {
  const Uploadimage({super.key});

  @override
  State<Uploadimage> createState() => _UploadimageState();
}

class _UploadimageState extends State<Uploadimage> {
  String selectedImagePath = '';
  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;
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
                onPressed: () async {
                  selectImage();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Imagenaming()));
                  setState(() {});
                },
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
        imagefiles != null
            ? Wrap(
                children: imagefiles!.map((imageone) {
                  return Container(
                      child: Card(
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image.file(File(imageone.path)),
                    ),
                  ));
                }).toList(),
              )
            : Container(),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.blue,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await openImages();

                            if (selectedImagePath != '') {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const Imagenaming()));
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/2.png',
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Gallery'),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  "No Image Captured !",
                                  style: CS_Font,
                                ),
                              ));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/1.png',
                                  height: 50,
                                  width: 50,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Camera'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        Navigator.pop(context);

        setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  selectImageFromCamera() async {
    XFile? pickedfiles = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (pickedfiles != null) {
      return pickedfiles.path;
    } else {
      return '';
    }
  }
}
