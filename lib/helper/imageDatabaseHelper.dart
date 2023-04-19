// // import 'dart:convert';
// // import 'package:sqflite/sqflite.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// // class DBFunctions {
// //   static late Database _dbImages;
// //   static Future<void> initializeDataBase() async {
// //     try {
// //       _dbImages = await openDatabase(
// //         "imageTable.db",
// //         version: 1,
// //         onCreate: (db, version) {
// //           db.execute("""
// //     CREATE TABLE imageTable (
// //      id INTEGER PRIMARY KEY,
// //      imageBase64 TEXT,
// //      imageName TEXT,
// //      """);
// //         },
// //       );

// //       /// remove this print later
// //       print("created database");
// //     } catch (e) {
// //       print("EC - while creating table as $e");
// //       throw e;
// //     }
// //   }
// // }

// // // Import the necessary packages
// // import 'package:path/path.dart';
// // import 'package:sqflite/sqflite.dart';

// // // Create a function to initialize the database
// // Future<Database> initializeDatabase() async {
// //   final databasePath = await getDatabasesPath();
// //   final path = join(databasePath, 'imageData.db');

// //   // Open the database and create the table if it doesn't exist
// //   final database = await openDatabase(
// //     path,
// //     version: 1,
// //     onCreate: (db, version) async {
// //       await db.execute(
// //         'CREATE TABLE imageData(id INTEGER PRIMARY KEY, imageBase64Data TEXT, imageName TEXT)',
// //       );
// //     },
// //   );

// //   return database;
// // }

// // // Create a function to insert the imageData into the database
// // Future<void> addImageDataToDatabase(
// //     List<Map<String, String>> imageDataList) async {
// //   try {
// //     final database = await initializeDatabase();

// //     // Loop through the imageDataList and insert each item into the database
// //     for (final imageData in imageDataList) {
// //       await database.insert(
// //         'imageBase64Data',
// //         imageData,
// //         conflictAlgorithm: ConflictAlgorithm.replace,
// //       );
// //       print("added data to database ");
// //     }

// //     // Close the database
// //     await database.close();
// //   } catch (e) {
// //     print("ED while adding contents to DB as $e");
// //     throw e;
// //   }
// //   // Initialize the database
// // }

// // Future<void> printImageDataFromDatabase() async {
// //   print("printing contents of database");

// //   try {
// //     final database = await initializeDatabase();

// //     // Query the imageData table and get all the rows
// //     final imageDataRows = await database.query('imageBase64');

// //     // Loop through the rows and print the data
// //     for (final imageDataRow in imageDataRows) {
// //       final id = imageDataRow['id'];
// //       final image = imageDataRow['imageBase64'];
// //       final imageName = imageDataRow['imageName'];

// //       print('ID: $id');
// //       print('Image: $image');
// //       print('Image Name: $imageName');
// //       print('\n');
// //     }

// //     // Close the database
// //     await database.close();
// //   } catch (e) {
// //     print("EC while printing contents of database as $e");
// //     throw e;
// //   }
// //   // Initialize the database
// // }

// ///
// ///
// ///
// ///
// ///version 3

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// Future<void> insertImageData(List<Map<String, dynamic>> imageDataList) async {
//   try {
//     // Open the database and create the table if it doesn't exist
//     final database = await openDatabase(
//       join(await getDatabasesPath(), 'image_data.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE image_data(id INTEGER PRIMARY KEY, imageBase64 TEXT, imageName TEXT)',
//         );
//       },
//       version: 1,
//     );
//     print("this is the database path");
//     print(database.path);
//     for (final imageData in imageDataList) {
//       await database.insert(
//         'image_data',
//         {
//           // 'imageBase64': imageData['imageBase64'],
//           'imageBase64': "imageData['imageBase64']",
//           'imageName': imageData['imageName'],
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//       print("adding data");
//     }
//     print("data added");
//   } catch (e) {
//     print("EC 1.1 DB as $e");
//     throw e;
//   }

//   // Insert each item in the list into the database
// }

// Future<void> printImageData() async {
//   // Open the database
//   final database = await openDatabase(
//     join(await getDatabasesPath(), 'image_data.db'),
//     version: 1,
//   );

//   // Query the database and print the results
//   final imageDataList = await database.query('image_data');
//   for (final imageData in imageDataList) {
//     print(
//         'id: ${imageData['id']}, imageBase64: ${imageData['imageBase64']}, imageName: ${imageData['imageName']}');
//   }
// }

// class ImageUploadFunctions {
//   static String baseUrl =
//       "https://e75s884i3d.execute-api.eu-west-1.amazonaws.com/dev/putsignedurl-surveyattachments/";

//   static String imagename = "sdsdssxsd_sampleimage.jpg";

//   // uploadImagesLoopFunction(int numberOfImages, String imageName) async {
//   //   late PurLasAsresponseJson purlresponseInstant;
//   //   late String purlResponseMessage;

//   //   try {
//   //     var url = Uri.parse(baseUrl + imageName);
//   //     final response = await http.get(url);
//   //     purlresponseInstant =
//   //         PurLasAsresponseJson.fromRawJson(response.body as String);
//   //     print("printing the instant");
//   //     print(purlresponseInstant);
//   //     purlResponseMessage = purlresponseInstant.psurl;
//   //     print("Priting the purl response message");
//   //     print(purlResponseMessage);
//   //   } catch (e) {
//   //     throw e;
//   //   }
//   // }

//   ///
//   ///
//   ///
//   ///
//   ///
//   /// v4  this is the best version yet produced

//   static Future<void> uploadImageData() async {
//     try {
//       final database = await openDatabase(
//         join(await getDatabasesPath(), 'image_data.db'),
//         version: 1,
//       );

//       final imageDataList = await database.query('image_data');

//       for (final imageData in imageDataList) {
//         print("loop started");
//         final String imageName = imageData['imageName'] as String;
//         print(imageName);
//         final String imageBase64Data = imageData['imageBase64'] as String;
//         print("this is the image data" + imageBase64Data);
//         // Convert the base64 data to bytes
//         final imageBytes = base64.decode(imageBase64Data);

//         // Get the signed URL from the API
//         final baseUrl =
//             "https://e75s884i3d.execute-api.eu-west-1.amazonaws.com/dev/putsignedurl-surveyattachments/";
//         final url = Uri.parse(baseUrl + imageName);
//         final response = await http.get(url);
//         final purlresponseInstant =
//             PurLasAsresponseJson.fromRawJson(response.body);
//         final purlResponseMessage = purlresponseInstant.psurl;

//         // Upload the image bytes to the signed URL
//         final cloudUrl = Uri.parse(purlResponseMessage);
//         // final cloudResponse = await http.post(cloudUrl, body: imageBytes);
//         print(" this is the presigned URL" + purlResponseMessage);
//         print("this is the cloud url in which we post the bytesalong " +
//             cloudUrl.toString());

//         print("Image '$imageName' uploaded with status code ");
//         // ${cloudResponse.statusCode}");
//       }
//     } catch (e) {
//       print("EC - error caught - 456254");
//       throw e;
//     }
//   }

//   static Future<void> uploadAsampleImagetoDatabase() async {
//     try {
//       final database = await openDatabase(
//         join(await getDatabasesPath(), 'image_data.db'),
//         version: 1,
//       );

//       final imageDataList = await database.query('image_data');

//       final String imageName = imageDataList[0]['imageName'] as String;
//       print(imageName);
//       // final String imageBase64Data = imageDataList[0]['imageBase64'] as String;
//       // print("this is the image data" + imageBase64Data);
//       // Convert the base64 data to bytes
//       // final imageBytes = base64.decode(imageBase64Data);
//       final imageBytes = "base64.decode(imageBase64Data)";

//       // Get the signed URL from the API
//       final baseUrl =
//           "https://e75s884i3d.execute-api.eu-west-1.amazonaws.com/dev/putsignedurl-surveyattachments/";
//       final url = Uri.parse(baseUrl + imageName);
//       final response = await http.get(url);
//       final purlresponseInstant =
//           PurLasAsresponseJson.fromRawJson(response.body);
//       final purlResponseMessage = purlresponseInstant.psurl;

//       // Upload the image bytes to the signed URL
//       final cloudUrl = Uri.parse(purlResponseMessage);
//       final cloudResponse = await http.post(cloudUrl, body: imageBytes);
//       print(" this is the presigned URL" + purlResponseMessage);
//       print("this is the cloud url in which we post the bytesalong " +
//           cloudUrl.toString());

//       print(
//           "Image '$imageName' uploaded with status code  ${cloudResponse.statusCode}");
//     } catch (e) {
//       print("EC - error caught - 456254");
//       throw e;
//     }
//   }
// }

// Future<void> printAllData() async {
//   // Open the database
//   final db = await openDatabase('image_data.db');

//   // Get all the rows from the database
//   final rows = await db.query('image_data');

//   // Convert the rows to a list of maps
//   final list = List<Map<String, dynamic>>.from(rows);

//   // Convert the list of maps to JSON
//   final json = jsonEncode(list);

//   // Print the JSON to the console
//   print(json);
// }

// // To parse this JSON data, do
// //
// //     final purLasAsresponseJson = purLasAsresponseJsonFromJson(jsonString);

// class PurLasAsresponseJson {
//   PurLasAsresponseJson({
//     required this.psurl,
//   });

//   String psurl;

//   factory PurLasAsresponseJson.fromRawJson(String str) =>
//       PurLasAsresponseJson.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory PurLasAsresponseJson.fromJson(Map<String, dynamic> json) =>
//       PurLasAsresponseJson(
//         psurl: json["psurl"],
//       );

//   Map<String, dynamic> toJson() => {
//         "psurl": psurl,
//       };
// }

////
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
///
///
///
///
///
///
///
///

// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class ImageDatabaseHelper {
//   static Database? _database;
//   static final ImageDatabaseHelper instance = ImageDatabaseHelper._();

//   ImageDatabaseHelper._();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final String databasePath = await getDatabasesPath();
//     final String path = join(databasePath, 'Image_list.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE Image_list(id INTEGER PRIMARY KEY AUTOINCREMENT, imageName TEXT, imageBase64 TEXT)',
//         );
//       },
//     );
//   }

//   static Future<void> saveImagesToDatabase(var imageJsonList) async {
//     final Database db = await ImageDatabaseHelper.instance.database;
//     for (Map<String, dynamic> imageJson in imageJsonList) {
//       await db.insert(
//         'Image_list',
//         {
//           'imageName': imageJson['details']['filename'],
//           'imageBase64':
//               """imagesList.firstWhere((element) => element['imageName'] == imageJson['details']['filename'])['imageBase64']"""
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//     }
//     // setState(() {
//     //   imagesList.clear();
//     //   imageJsonList.clear();
//     // });
//   }
// }

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
///
///
///
///

// class ImageDatabaseHelper {
//   static final String _databaseName = 'image_database.db';
//   static final int _databaseVersion = 1;
//   static final String _tableName = 'ImageData';
//   static final String columnId = 'id';
//   static final String columnImageName = 'imageName';
//   static final String columnImageBlob = 'imageBlob';

//   static Future<Database> _database() async {
//     final String path = join(await getDatabasesPath(), _databaseName);
//     return openDatabase(path, version: _databaseVersion,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
//         CREATE TABLE $_tableName (
//           $columnId INTEGER PRIMARY KEY,
//           $columnImageName TEXT,
//           $columnImageBlob BLOB
//         )
//       ''');
//     });
//   }

//   static Future<void> saveImagesToDatabase(
//       List<Map<String, Object>> imageList) async {
//     final Database db = await _database();
//     final Batch batch = db.batch();
//     for (Map<String, Object> imageData in imageList) {

//       batch.insert(_tableName, {
//         columnImageName: imageData['imageName'] as String,
//         columnImageBlob: imageData['imageBlob'] as Uint8List,
//       });
//       print("adding images to database");
//     }
//     await batch.commit();
//     print("complete adding images to database");
//   }

//   static Future<void> printImagesFromDatabase() async {
//     final Database db = await _database();
//     final List<Map<String, dynamic>> result = await db.query(_tableName);
//     for (Map<String, dynamic> row in result) {
//       final String imageName = row[columnImageName] as String;
//       final Uint8List imageBlob = row[columnImageBlob] as Uint8List;
//       print('Image Name: $imageName, Image Blob: ${imageBlob.toString()}');
//     }
//   }

//   static Future<List<String>> getAllImages() async {
//     final db = await _database();
//     final List<Map<String, dynamic>> maps = await db.query(_tableName);

//     return List.generate(maps.length, (i) => maps[i]['url'] as String);
//   }
// }

///
///
///
///
///
// version 2

import 'dart:convert';
import 'dart:typed_data';

import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:cybersmart/screens/Section%201/CERTIFICATE_OF_REGISTRY/UploadImage/uploadImageClass.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:collection';
import 'package:collection/collection.dart';

class ImageDatabaseHelper {
  static final String _databaseName = 'image_database.db';
  static final int _databaseVersion = 1;
  static final String _tableName = 'ImageData';
  static final String columnId = 'id';
  static final String columnImageName = 'imageName';
  static final String columnImageBlob = 'imageBlob';

  static Future<Database> _database() async {
    final String path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, version: _databaseVersion,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE $_tableName (
          $columnId INTEGER PRIMARY KEY,
          $columnImageName TEXT,
          $columnImageBlob BLOB
        )
      ''');
    });
  }

  static deleteSpecificImageFromImageTable(imageName) async {
    Database db = await _database();
    // db.execute(sql);
    await db.delete(
      'image_Data',
      where: 'ImageName = ?',
      whereArgs: [imageName],
    );
  }

  // static Future<List<Map<String, dynamic>>?> returnSelectedImageBlobAndName(
  //     List<String> imageNameList) async {
  //   print("trying to return images blob and name map");

  //   try {
  //     if (imageNameList.length != 0) {
  //       Database db = await _database();

  //       List<Map<String, dynamic>> images = [];

  //       for (String name in imageNameList) {
  //         print("loop initiated");
  //         List<Map<String, dynamic>> result = await db.query(_tableName,
  //             columns: [columnImageBlob],
  //             where: '$columnImageName = ?',
  //             whereArgs: [name]);

  //         if (result.isNotEmpty) {
  //           Uint8List imageBytes = result.first[columnImageBlob];
  //           Map<String, dynamic> imageMap = {
  //             'imageName': name,
  //             'imageBlob': imageBytes
  //           };
  //           images.add(imageMap);
  //         }
  //       }

  //       await db.close();
  //       print("returning images list");
  //       print(images);

  //       return images;
  //     } else {
  //       print("NO image name found in list");
  //     }
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  ///
  ///
  ///
  ///updated functino for returning the image name and blob as an instance of class
  ///
  static Future<List<ImageNameAndBlob>> returnSelectedImageBlobAndName(
      List<String> imageNameList) async {
    print("trying to return images blob and name map");

    try {
      Database db = await _database();

      List<ImageNameAndBlob> images = [];

      for (String name in imageNameList) {
        print("loop initiated");
        List<Map<String, dynamic>> result = await db.query(
          _tableName,
          columns: [columnImageBlob],
          where: '$columnImageName = ?',
          whereArgs: [name],
        );

        if (result.isNotEmpty) {
          Uint8List imageBytes = result.first[columnImageBlob];
          //  imageBlob = imageBytes.toList();
          ImageNameAndBlob imageNameAndBlob =
              ImageNameAndBlob(imageName: name, imageBlob: imageBytes);
          images.add(imageNameAndBlob);
          // print("this is the image name and blob");
          // print(imageNameAndBlob.imageBlob);
          // print(imageNameAndBlob.imageName);
        }
      }

      await db.close();
      // print("returning images list");
      // print(images);

      return images;
    } catch (e) {
      throw e;
    }
  }

  static Future<void> deleteAllImagesFromDatabase() async {
    final db = await _database();
    db.delete(_tableName);
  }

  static Future<void> saveImagesToDatabase(
      List<ImageNameAndBlob> imageList) async {
    final Database db = await _database();
    final Batch batch = db.batch();
    for (ImageNameAndBlob imageData in imageList) {
      final String imageName = imageData.imageName;
      final List<int> imageBytes = imageData.imageBlob;
      final Uint8List imageBytesUint8 = Uint8List.fromList(imageBytes);
      // Compress the image bytes
      // Compress the image bytes
      final List<int> compressedBytes =
          await FlutterImageCompress.compressWithList(
        imageBytesUint8,
        minHeight: 600,
        minWidth: 800,
        quality: 80,
      );

      // Check if an image with the same name already exists
      final List<Map<String, dynamic>> result = await db.query(_tableName,
          where: '$columnImageName = ?', whereArgs: [imageName]);
      if (result.isNotEmpty) {
        // Update the existing image with the new compressed image bytes
        final int id = result[0][columnId];
        batch.update(
          _tableName,
          {columnImageBlob: compressedBytes},
          where: '$columnId = ?',
          whereArgs: [id],
        );
      } else {
        // Add the new image to the database
        batch.insert(_tableName, {
          columnImageName: imageName,
          columnImageBlob: compressedBytes,
        });
      }
      print("adding images to database");
    }
    await batch.commit();
    print("complete adding images to database");
  }

  static Future<void> printImagesFromDatabase() async {
    final Database db = await _database();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    for (Map<String, dynamic> row in result) {
      final String imageName = row[columnImageName] as String;
      final Uint8List imageBlob = row[columnImageBlob] as Uint8List;
      print('Image Name: $imageName, Image Blob: ${imageBlob.toString()}');
    }
  }

  Future<List<Map<String, Uint8List>>> getImageBlobs(
      List<String> imageNames) async {
    final Database db = await openDatabase(
      // path to database file
      'path/to/database.db',
    );

    final List<Map<String, Uint8List>> imageBlobs = [];

    for (final String imageName in imageNames) {}

    await db.close();

    return imageBlobs;
  }

  static Future<List<Uint8List>> getAllImages() async {
    try {
      final db = await _database();
      final List<Map<String, dynamic>> maps = await db.query(_tableName);
      print("This many images are in the database: ${maps.length}");

      List<Uint8List> images = [];

      for (Map<String, dynamic> map in maps) {
        images.add(Uint8List.fromList(map['imageBlob']));
      }
      print(images);
      return images;
    } catch (e) {
      throw e;
    }
  }

// pritns the number of rows in the database
  static Future<int> getRowCount() async {
    final db = await _database(); // Obtain a reference to the database.
    final result = await db.rawQuery(
        'SELECT COUNT(*) FROM $_tableName'); // Execute an SQL query that counts the rows.
    final count = result.first.values.first
        as int; // Extract the count from the query result.
    print(count);
    return count;
  }

  static Future<String> getAllImagesInJson() async {
    try {
      final db = await _database();
      final List<Map<String, dynamic>> maps = await db.query(_tableName);

      List<Map<String, dynamic>> imageList = [];
      print("this many items are in the database");
      print(imageList.length);

      for (Map<String, dynamic> map in maps) {
        imageList.add({
          'imageName': map['imageName'],
          'imageBlob': map['imageBlob'],
        });
        print(imageList);
      }

      return json.encode(imageList);
    } catch (e) {
      throw e;
    }
  }
}

class ImageNameAndBlob {
  String imageName;
  Uint8List imageBlob;

  ImageNameAndBlob({required this.imageName, required this.imageBlob});
}
