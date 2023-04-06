import 'dart:convert';

import 'package:cybersmart/helper/database_functions.dart';
import 'package:cybersmart/helper/section1Functions.dart';
import 'package:cybersmart/model%20classes/section%201/section1PutResponseModel.dart';
import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:http/http.dart' as http;

class ApiOperations {
  static String baseUrl2 =
      "https://56grqwuzj1.execute-api.eu-west-1.amazonaws.com";

  static var client = http.Client();

  static Future<String?> postSection1contents() async {
    String api2 = "/dev/fsi/section1/c0vn17t9";
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
          "https://56grqwuzj1.execute-api.eu-west-1.amazonaws.com/dev/fsi/section1/c0vn17t9");
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
}

// try {
//       print("updating process 2 initialized");
//       // var url = Uri.parse(ApiOperations.baseUrl2 + api);
//       var url = Uri.parse(
//           "https://56grqwuzj1.execute-api.eu-west-1.amazonaws.com/dev/fsi/section1/c0vn17t9");
//       //  _payload = json.encode(object);
//       _response = await client.post(url, body: object);
//       print("printing payload ");
//       // print(json.decode(_payload));
//     } catch (e) {
//       print("EC - while updating to cloud - $e");
//       // return "failed";
//     }
//     try {
//       print("updating process 3 initialized");
//       section1PutResponseInstance =
//           section1PutResponseModelFromJson(_response.body);
//       print("this is the response " + section1PutResponseInstance.message);
//       if (section1PutResponseInstance.message == "Section 1 updated") {
//         print("updated succesfully");
//         // return "success";
//       } else {
//         // return "failed";
//       }
//     } catch (e) {
//       print("EC- in response of updating section 1 to cloud - $e");
//       // return "failed";
//     }