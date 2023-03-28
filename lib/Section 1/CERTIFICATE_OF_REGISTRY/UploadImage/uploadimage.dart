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
  // List<XFile>? imagefiles;
  List imagefilesdemo = [
    0,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (imagefilesdemo.length == 1)
            ? Center(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 44,
                  width: 180,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CS_BodyContainerColor,
                          foregroundColor: Color(0xff4AA080)),
                      onPressed: () async {
                        selectImage();
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
              )
            : Container(),
        SizedBox(
          height: 20,
        ),
        (imagefilesdemo.length == 1)
            ? Container()
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: imagefilesdemo.length,
                itemBuilder: (BuildContext context, int index) {
                  return (index == 0)
                      ? GestureDetector(
                          onTap: () async {
                            selectImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(.5)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Icon(Icons.file_upload_outlined,
                                        size: 40),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("UPLOAD")
                                ],
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(.5)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: FileImage(
                                              File(imagefilesdemo[index].path),
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.red,
                                          ),
                                          child: Icon(
                                            Icons.delete_outline_rounded,
                                            color: Colors.white,
                                          )),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Text(
                                      "image Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _asyncInputDialog(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset("images/Icon.png"),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                }),
      ],
    );
  }

// image selection =========================================================================================================================================================
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  selectedImagePath = await imageselect();

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
                                child: Image.asset(
                                  'images/2.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Gallery'),
                            ],
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

//take name from user =======================================================================================================================================================
  Future _asyncInputDialog(BuildContext context) async {
    String teamName = '';
    return showDialog(
      context: context,
      barrierDismissible:
          false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Container(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    "images/Question.png",
                  )),
              SizedBox(
                height: 10,
              ),
              Text('Do you want to Change the name?'),
            ],
          ),
          content: new Row(
            children: [
              new Expanded(
                  child: new TextField(
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff279B1D), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff465245), width: 2.0),
                  ),
                  hintText: 'Enter your name here',
                ),
                onChanged: (value) {
                  teamName = value;
                },
              ))
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4AA080),
                  foregroundColor: CS_BodyContainerColor),
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop(teamName);
              },
            ),
          ],
        );
      },
    );
  }

// Image Selection gallery ============================================================================================================================================================
  imageselect() async {
    final List<XFile>? selectedImage = await imgpicker.pickMultiImage();

    if (selectedImage!.isNotEmpty) {
      imagefilesdemo.addAll(selectedImage);
    }

    setState(() {});
  }

  selectImageFromCamera() async {
    XFile? selectedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (selectedImage != null) {
      return selectedImage.path;
    } else {
      return '';
    }
  }
}
