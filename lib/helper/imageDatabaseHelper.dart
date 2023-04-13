// import 'dart:convert';
// import 'package:sqflite/sqflite.dart';

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
          'imageBase64': imageData['imageBase64Data'],
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
    print('id: ${imageData['id']}, imageBase64: ${imageData['imageBase64']}, imageName: ${imageData['imageName']}');
  }
}

