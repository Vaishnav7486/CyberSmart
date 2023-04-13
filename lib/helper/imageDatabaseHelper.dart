// import 'dart:convert';
// import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// class DBFunctions {
//   static late Database _dbImages;
//   static Future<void> initializeDataBase() async {
//     try {
//       _dbImages = await openDatabase(
//         "imageTable.db",
//         version: 1,
//         onCreate: (db, version) {
//           db.execute("""
//     CREATE TABLE imageTable (
//      id INTEGER PRIMARY KEY,
//      imageBase64 TEXT,
//      imageName TEXT,
//      """);
//         },
//       );

//       /// remove this print later
//       print("created database");
//     } catch (e) {
//       print("EC - while creating table as $e");
//       throw e;
//     }
//   }
// }

// // Import the necessary packages
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// // Create a function to initialize the database
// Future<Database> initializeDatabase() async {
//   final databasePath = await getDatabasesPath();
//   final path = join(databasePath, 'imageData.db');

//   // Open the database and create the table if it doesn't exist
//   final database = await openDatabase(
//     path,
//     version: 1,
//     onCreate: (db, version) async {
//       await db.execute(
//         'CREATE TABLE imageData(id INTEGER PRIMARY KEY, imageBase64Data TEXT, imageName TEXT)',
//       );
//     },
//   );

//   return database;
// }

// // Create a function to insert the imageData into the database
// Future<void> addImageDataToDatabase(
//     List<Map<String, String>> imageDataList) async {
//   try {
//     final database = await initializeDatabase();

//     // Loop through the imageDataList and insert each item into the database
//     for (final imageData in imageDataList) {
//       await database.insert(
//         'imageBase64Data',
//         imageData,
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//       print("added data to database ");
//     }

//     // Close the database
//     await database.close();
//   } catch (e) {
//     print("ED while adding contents to DB as $e");
//     throw e;
//   }
//   // Initialize the database
// }

// Future<void> printImageDataFromDatabase() async {
//   print("printing contents of database");

//   try {
//     final database = await initializeDatabase();

//     // Query the imageData table and get all the rows
//     final imageDataRows = await database.query('imageBase64');

//     // Loop through the rows and print the data
//     for (final imageDataRow in imageDataRows) {
//       final id = imageDataRow['id'];
//       final image = imageDataRow['imageBase64'];
//       final imageName = imageDataRow['imageName'];

//       print('ID: $id');
//       print('Image: $image');
//       print('Image Name: $imageName');
//       print('\n');
//     }

//     // Close the database
//     await database.close();
//   } catch (e) {
//     print("EC while printing contents of database as $e");
//     throw e;
//   }
//   // Initialize the database
// }

///
///
///
///
///version 3

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> insertImageData(List<Map<String, dynamic>> imageDataList) async {
  try {
    // Open the database and create the table if it doesn't exist
    final database = await openDatabase(
      join(await getDatabasesPath(), 'image_data.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE image_data(id INTEGER PRIMARY KEY, imageBase64 TEXT, imageName TEXT)',
        );
      },
      version: 1,
    );
    for (final imageData in imageDataList) {
      await database.insert(
        'image_data',
        {
          'imageBase64': imageData['imageBase6445'],
          'imageName': imageData['imageName'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("adding data");
    }
    print("data added");
  } catch (e) {
    print("EC 1.1 DB as $e");
    throw e;
  }

  // Insert each item in the list into the database
}

Future<void> printImageData() async {
  // Open the database
  final database = await openDatabase(
    join(await getDatabasesPath(), 'image_data.db'),
    version: 1,
  );

  // Query the database and print the results
  final imageDataList = await database.query('image_data');
  for (final imageData in imageDataList) {
    print(
        'id: ${imageData['id']}, imageBase64: ${imageData['imageBase64']}, imageName: ${imageData['imageName']}');
  }
}

Future<void> clearImageData() async {
  final Database database = await openDatabase(
    join(await getDatabasesPath(), 'image_data.db'),
    version: 1,
  ); // Assuming you have a function named "getDatabase()" that returns a Sqflite database instance.

  await database.delete(
      'image_data'); // This will delete all rows from the "image_data" table.
}

class ImageUploadFunctions {
  static String baseUrl =
      "https://e75s884i3d.execute-api.eu-west-1.amazonaws.com/dev/putsignedurl-surveyattachments/";

  static String imagename = "sdsdssxsd_sampleimage.jpg";

  // uploadImagesLoopFunction(int numberOfImages, String imageName) async {
  //   late PurLasAsresponseJson purlresponseInstant;
  //   late String purlResponseMessage;

  //   try {
  //     var url = Uri.parse(baseUrl + imageName);
  //     final response = await http.get(url);
  //     purlresponseInstant =
  //         PurLasAsresponseJson.fromRawJson(response.body as String);
  //     print("printing the instant");
  //     print(purlresponseInstant);
  //     purlResponseMessage = purlresponseInstant.psurl;
  //     print("Priting the purl response message");
  //     print(purlResponseMessage);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  ///
  ///
  ///
  ///
  ///
  /// v4  this is the best version yet produced

  static Future<void> uploadImageData() async {
    try {
      final database = await openDatabase(
        join(await getDatabasesPath(), 'image_data.db'),
        version: 1,
      );

      final imageDataList = await database.query('image_data');

      for (final imageData in imageDataList) {
        print("loop started");
        final String imageName = imageData['imageName'] as String;
        print(imageName);
        final String imageBase64Data = imageData['imageBase64'] as String;
        print("this is the image data" + imageBase64Data);
        // Convert the base64 data to bytes
        final imageBytes = base64.decode(imageBase64Data);

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
        print(" this is the presigned URL" + purlResponseMessage);
        print("this is the cloud url in which we post the bytesalong " +
            cloudUrl.toString());

        print("Image '$imageName' uploaded with status code ");
        // ${cloudResponse.statusCode}");
      }
    } catch (e) {
      print("EC - error caught - 456254");
      throw e;
    }
  }

  static Future<void> uploadAsampleImagetoDatabase() async {
    try {
      final database = await openDatabase(
        join(await getDatabasesPath(), 'image_data.db'),
        version: 1,
      );

      final imageDataList = await database.query('image_data');

      final String imageName = imageDataList[0]['imageName'] as String;
      print(imageName);
      // final String imageBase64Data = imageDataList[0]['imageBase64'] as String;
      // print("this is the image data" + imageBase64Data);
      // Convert the base64 data to bytes
      // final imageBytes = base64.decode(imageBase64Data);
      final imageBytes = "base64.decode(imageBase64Data)";

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
      final cloudResponse = await http.post(cloudUrl, body: imageBytes);
      print(" this is the presigned URL" + purlResponseMessage);
      print("this is the cloud url in which we post the bytesalong " +
          cloudUrl.toString());

      print(
          "Image '$imageName' uploaded with status code  ${cloudResponse.statusCode}");
    } catch (e) {
      print("EC - error caught - 456254");
      throw e;
    }
  }
}

Future<void> printAllData() async {
  // Open the database
  final db = await openDatabase('image_data.db');

  // Get all the rows from the database
  final rows = await db.query('image_data');

  // Convert the rows to a list of maps
  final list = List<Map<String, dynamic>>.from(rows);

  // Convert the list of maps to JSON
  final json = jsonEncode(list);

  // Print the JSON to the console
  print(json);
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
