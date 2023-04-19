import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cybersmart/helper/database_functions.dart';
import 'package:cybersmart/helper/imageDatabaseHelper.dart';
import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadSection extends StatefulWidget {
  ImageUploadSection(
      {super.key, required this.section1Instance, required this.formName});
  Section1Modelsample1 section1Instance;
  String formName;

  @override
  State<ImageUploadSection> createState() => _ImageUploadSectionState();
}

class _ImageUploadSectionState extends State<ImageUploadSection> {
  late Section1Modelsample1 section1Instance;
  late List<Attachment> attachmentList = [];
  late List<ImageNameAndBlob> imageNameAndBlobList = [];
  late List<ImageNameAndBlob> imageNameAndBlobList_Helper = [];
  List<Attachment> tempImageHolder_AttchInst = [];
  List<ImageNameAndBlob> tempImageHolder_NameAndBlobInst = [];
  late int selectedFormIndexNumber;
  String samplevariable = "";
  @override
  void initState() {
    setState(() {
      selectedFormIndexNumber = returnNumberBasedOntheFormName()!;
    });
    super.initState();
    setState(() {
      section1Instance = widget.section1Instance;
      attachmentList = widget.section1Instance.presurveyInfo[0]
          .registryRequirements[selectedFormIndexNumber].details.attachments;
    });
    print("printing attachment list");
    print(attachmentList);
    chackIfAttatchmentListIsEmptyIfNotReturnTheNameAndBlobOfTheSelectedImages();
  }

  updateAttachmentListAndImageNameAndBlob() {}

  chackIfAttatchmentListIsEmptyIfNotReturnTheNameAndBlobOfTheSelectedImages() async {
    try {
      List<String> imageNameList = [];
      helperFunctionToSetValuesToImageNameList() async {
        imageNameList = await getImageNameList(attachmentList);
        print(
            "this is the image name list received from the function x21 Mark ");
        print(imageNameList);
        setValueToImageNameAndBlobListHelperFunction(imageNameList);
      }

      if (attachmentList.length > 0) {
        print(
            "trying to get the image name list as the attatchment list id not zero");
        setState(() {
          helperFunctionToSetValuesToImageNameList();
        });
        print("trying to get the image name and blob from database");
      }
    } catch (e) {
      print(
          "EC checking if attatchment list is empty or not, if not retutn the image name");
      throw e;
    }
  }

  setValueToImageNameAndBlobListHelperFunction(imageNameList) async {
    print("this is the name list passing to the db");
    print(imageNameList);
    setState(() {
      helperFunctionSetValuesToIMageNameAndBlobList(imageNameList);
    });
  }

  helperFunctionSetValuesToIMageNameAndBlobList(imageNameList) async {
    print("image name list finally passing is mark xbc32");
    print(imageNameList);
    imageNameAndBlobList_Helper =
        await ImageDatabaseHelper.returnSelectedImageBlobAndName(imageNameList);
    setState(() {
      imageNameAndBlobList = imageNameAndBlobList_Helper;
      print(
          "this is the image name and blob list that we have received from database");
      print(imageNameAndBlobList);
    });
  }

  List<String> getImageNameList(List<Attachment> attachmentList) {
    List<String> imageNameList = [];
    try {
      for (var i = 0; i < attachmentList.length; i++) {
        imageNameList.add(attachmentList[i].details.filename);
      }
      print(
          "printing the image name list before returning it from the function");
      print(imageNameList);
      return imageNameList;
    } catch (e) {
      print("EC trying to return the list of image name");
      throw e;
    }
  }

  // this function prints the values within the section 1 instance and the attatchmentlist,
  // so this function can be used to see what is inside the section 1 instance and the attatchment list
  printsectioninstanceandattatchmentvalues() {
    print("printing the instance of section 1");
    // print(section1Instance);
    print(jsonEncode(section1Instance));
    print("printing the values inside attatchment list");
    // print(attachmentList);
    print(jsonEncode(attachmentList));
  }

  ///
  ///
  ///
  ///
  /// this is the function for picking images and then storing that into the temporary variables
  ///
  Future<void> _pickImages() async {
    try {
      print("trying to pick images and save them in the temporary list");
      final picker = ImagePicker();
      final pickedImages = await picker.pickMultiImage();
      if (pickedImages != null) {
        for (var imageFile in pickedImages) {
          print("loop running for images selection and storing");
          final imageBytes = await imageFile.readAsBytes();
          final imageName = imageFile.name;
          final imageNameAndBlob = ImageNameAndBlob(
            imageName: imageName,
            imageBlob: Uint8List.fromList(imageBytes),
          );
          final attachment = Attachment(
            details: AttachmentDetails(
              filename: imageName,
              filetype: imageFile.name.split('.').last,
              globalAttachments: false,
              name: imageName,
              pointId: '',
              remarkofFile: '',
              sectionId: '',
            ),
            id: 0,
          );
          setState(() {
            tempImageHolder_AttchInst.add(attachment);
            tempImageHolder_NameAndBlobInst.add(imageNameAndBlob);
            print(tempImageHolder_AttchInst);
            print(tempImageHolder_NameAndBlobInst);
          });
        }
      }
    } catch (e) {}
  }

  ///
  ///
  ///
  ///return a number depending upon the form
  ///

  int? returnNumberBasedOntheFormName() {
    switch (widget.formName) {
      case "CERTIFICATE OF REGISTRY":
        return 0;
        break;
      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
        return 1;
        break;
      case "MINIMUM SAFE MANNING CERTIFICATE":
        return 2;
        break;
      case "RADIO STATION LICENSE":
        return 3;
        break;
      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
        return 4;
        break;
      case "MS NOTICES FILE":
        return 5;
        break;
      case "TECHNICAL NOTES":
        return 6;
        break;
      case "MERCHANT SHIPPING ACT (CAP.234)":
        return 7;
        break;
      case "MS ACT SUBSIDIARY LEGISLATION":
        return 8;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(" new section"),

        ///
        ///
        ///
        /// to select images
        ElevatedButton(
            onPressed: () {
              _pickImages();
            },
            child: Text("select images")),

        ///
        ///
        ///
        ///
        ///
        ///save the section 1 instance to the database
        ElevatedButton(
            onPressed: () async {
              // adding images temporarily stored to the attatchments
              setState(() {
                section1Instance
                    .presurveyInfo[0]
                    .registryRequirements[selectedFormIndexNumber]
                    .details
                    .attachments
                    .addAll(tempImageHolder_AttchInst);
              });
              String message_updationOfDataToDatabase =
                  await DBFunctions.saveAndUpdateInstanceOfSection1ToDatabase(
                      section1Instance);
              if (message_updationOfDataToDatabase == "success") {
                Fluttertoast.showToast(
                    msg: "value of section 1 instance updated to database");
              } else if (message_updationOfDataToDatabase == "failed") {
                Fluttertoast.showToast(
                    msg:
                        "failed to update value of section 1 instance to database");
              }
              //printing contents inside the attachment od secction 1 instance
              print("printing the attachment in section 1 instance");
              print(section1Instance
                  .presurveyInfo[0]
                  .registryRequirements[selectedFormIndexNumber]
                  .details
                  .attachments);

              // saving images to the images table
              await ImageDatabaseHelper.saveImagesToDatabase(
                  tempImageHolder_NameAndBlobInst);
              //updating the values in the temporary helper lists back to nothing
              setState(() {
                tempImageHolder_AttchInst = [];
                tempImageHolder_NameAndBlobInst = [];
              });
              await chackIfAttatchmentListIsEmptyIfNotReturnTheNameAndBlobOfTheSelectedImages();
            },
            child: Text("Save images images")),

        ///
        ///
        ///
        ///
        /// to prinnt all the lists and variables in the widget class
        ElevatedButton(
            onPressed: () {
              print("this is the attachment list");
              print(attachmentList);
              print("this is the iamgenameandBlob list");
              print(imageNameAndBlobList);
              print("this is the temp image list");
              print(tempImageHolder_AttchInst);
              print("this is the temp image name and blob list");
              print(tempImageHolder_NameAndBlobInst);
            },
            child: Text("print all things")),

        ///
        ///
        ///
        ///print the contents in the image table as string
        ///
        ElevatedButton(
            onPressed: () {
              // helpershit1() async {
              //   samplevariable = await ImageDatabaseHelper.getAllImagesInJson();
              // }

              // setState(() {
              //   helpershit1();
              // });

              // print(samplevariable);
              ImageDatabaseHelper.getRowCount();
            },
            child: Text("print contents in the image database")),
        // Text(samplevariable),

        ///
        ///
        ///
        ///
        /// show presently selected images
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: tempImageHolder_NameAndBlobInst.length,
            itemBuilder: (context, index) {
              // here the temporarily selected images should
              return Stack(
                children: [
                  Image.memory(
                      tempImageHolder_NameAndBlobInst[index].imageBlob),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            tempImageHolder_AttchInst.removeAt(index);
                            tempImageHolder_NameAndBlobInst.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete)),
                  ),
                ],
              );
            }),

        // shows images from the section 1 instance attachments and database
        GridView.builder(
            itemCount: (imageNameAndBlobList.length),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              final Uint8List bytes =
                  Uint8List.fromList(imageNameAndBlobList[index].imageBlob);
              return Stack(
                children: [
                  Image.memory(
                    bytes,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            ImageDatabaseHelper
                                .deleteSpecificImageFromImageTable(
                                    section1Instance
                                        .presurveyInfo[0]
                                        .registryRequirements[
                                            selectedFormIndexNumber]
                                        .details
                                        .attachments[index]
                                        .details
                                        .filename);
                            section1Instance
                                .presurveyInfo[0]
                                .registryRequirements[selectedFormIndexNumber]
                                .details
                                .attachments
                                .removeAt(index);
                            chackIfAttatchmentListIsEmptyIfNotReturnTheNameAndBlobOfTheSelectedImages();
                          });
                        },
                        icon: Icon(Icons.delete)),
                  ),
                ],
              );
            })
      ],
    );
  }
}

///
///
///iomage name and blob model class
