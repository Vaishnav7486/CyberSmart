import 'dart:convert';
import 'dart:typed_data';

import 'package:cybersmart/helper/database_functions.dart';
import 'package:cybersmart/helper/imageDatabaseHelper.dart';
import 'package:cybersmart/helper/section1Functions.dart';
import 'package:cybersmart/model%20classes/section%201/section1PutResponseModel.dart';
import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ApiOperations {
  static String baseUrl2 =
      "https://56grqwuzj1.execute-api.eu-west-1.amazonaws.com";

  static var client = http.Client();

  static Future<String?> postSection1contents() async {
    String api2 = "/dev/fsi/section1/54ymc6gh";
    String updateResponseVariable;
    Section1Modelsample1 objectToPass =
        await DBFunctions.returnSection1Object();
    print("printing the object to pass\n$objectToPass");

    updateResponseVariable = await postsection1(api2, objectToPass);
    return updateResponseVariable;

    // postsection1(api2, objectToPass);
  }

  static Future<String> postsection1(
      String api, Section1Modelsample1 object) async {
    Section1PutResponseModel responseBodyInstance;
    try {
      print("updating process 1 initialized");
      var url = Uri.parse(
          "https://56grqwuzj1.execute-api.eu-west-1.amazonaws.com/dev/fsi/section1/54ymc6gh");
      var _payload = await json.encode(object);
      var _response = await client.put(url, body: _payload);

      print("printing response body");
      print(_response.body);
      responseBodyInstance =
          section1PutResponseModelFromJson(_response.body as String);
    } catch (e) {
      throw e;
    }
    if (responseBodyInstance.message == "Section 1 updated") {
      return "success";
    } else {
      return "failed";
    }

    // Section1PutResponseModel section1PutResponseInstance;
  }

  static Future<void> syncImagesToCloud() async {
    try {
      print("syncing images to cloud");
      final database = await openDatabase(
        join(await getDatabasesPath(), 'image_data.db'),
        version: 1,
      );

      final imageDataJson = await ImageDatabaseHelper.getAllImagesInJson();
      final imageDataList = json.decode(imageDataJson);

      for (final imageData in imageDataList) {
        print("loop started");
        final String imageName = imageData['imageName'] as String;
        print(imageName);
        final imageBlobData = imageData['imageBlob'];
        print("printing image blob");
        print(imageBlobData);
        // Convert the base64 data to bytes
        // final imageBytes = base64.decode(imageBlobData);

        // Get the signed URL from the API
        final baseUrl =
            "https://e75s884i3d.execute-api.eu-west-1.amazonaws.com/dev/putsignedurl-surveyattachments/";
        final url = Uri.parse(baseUrl + imageName);
        final response = await http.get(url);
        final purlresponseInstant =
            PurLasAsresponseJson.fromRawJson(response.body);
        final purlResponseMessage = purlresponseInstant.psurl;

        // Upload the image bytes to the signed URL
        final cloudUrl = Uri.parse(purlResponseMessage);
        // final cloudResponse = await http.post(cloudUrl, body: imageBytes);
        final cloudResponse = await http.put(cloudUrl, body: imageBlobData);
        print(" this is the presigned URL");
        print(purlResponseMessage);
        print("this is the cloud url in which we post the bytesalong " +
            cloudUrl.toString());
        print(cloudUrl.toString());

        print(
            "Image '$imageName' uploaded with status code ${cloudResponse.statusCode}");
      }
    } catch (e) {
      print("EC - error caught - 456254");
      throw e;
    }
  }
}

// To parse this JSON data, do
//
//     final purLasAsresponseJson = purLasAsresponseJsonFromJson(jsonString);

class PurLasAsresponseJson {
  PurLasAsresponseJson({
    required this.psurl,
  });

  String psurl;

  factory PurLasAsresponseJson.fromRawJson(String str) =>
      PurLasAsresponseJson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurLasAsresponseJson.fromJson(Map<String, dynamic> json) =>
      PurLasAsresponseJson(
        psurl: json["psurl"],
      );

  Map<String, dynamic> toJson() => {
        "psurl": psurl,
      };
}


  // fetchDataFromDatabase() async {
    // unit8listvariable_helper = await ImageDatabaseHelper.getAllImages();
    // imageListHelper =
    //     unit8listvariable_helper.map((e) => Image.memory(e)).toList();

  //   setState(() {
  //     unit8listvariable = unit8listvariable_helper;
  //     imageList = imageListHelper;
  //   });
  //   print("printing from the init state ");
  //   print(unit8listvariable);
  // }