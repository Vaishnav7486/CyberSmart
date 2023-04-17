import 'package:cybersmart/HomePage/Homepage.dart';
import 'package:cybersmart/helper/database_functions.dart';
import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:cybersmart/screens/Section%201/xbcx21/sampleImageUploadScreen.dart';
import 'package:cybersmart/screens/imageselection_screen/image_selection_screen.dart';
import 'package:cybersmart/services/api_operations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  String contentsOsSection1 = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Project List",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Homepage(
                              projectID: "54ymc6gh",
                              // previous project id was c0vn17t9
                            )));
              },
              child: Container(
                // height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Project Name : this is the sample project name",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Project Id : 54ymc6gh",
                      // 54ymc6gh
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Created On : 12/1/2023",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            ///
            // /add projec to database
            // /
            // /
            ElevatedButton(
                onPressed: () async {
                  String isSuccess =
                      await DBFunctions.addProjectToDatabaseSampl();
                  if (isSuccess == "success") {
                    Fluttertoast.showToast(msg: "Project added to database");
                  } else if (isSuccess == "failed") {
                    Fluttertoast.showToast(msg: "Failed to add project");
                  }
                },
                child: Text("create new project with id 54ymc6gh")),

            // /
            // /
            // /print all contents of database
            // /
            // // /
            ElevatedButton(
                onPressed: () {
                  DBFunctions.printAllContentsofDatabase();
                },
                child: Text("print contents of database")),

            // /
            // /
            // /
            // /delete all contenets from database
            // /
            // /
            // /
            // ElevatedButton(
            //     onPressed: () {
            //       /// DBFunctions.deleteAllcontentsFromDatabase();
            //     },
            //     child: Text("delete all data from database")),

            // /
            // /
            // /
            ElevatedButton(
                onPressed: () {
                  DBFunctions.pushSampleDataToSection1();
                },
                child: Text("set sample data to section 1")),

            // /
            // /
            // /
            // /print contents of section1 where id = 54ymc6gh
            // /
            // /
            // /
            ElevatedButton(
                onPressed: () {
                  DBFunctions.returnsection1instance('54ymc6gh');
                },
                child: Text("print section 1 data")),

            ///
            ///
            ///
            ///

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageSelectinoScreen()));
                },
                child: Text("Goto image selection screen")),

            ///
            ///
            ///
            ///
            SizedBox(height: 40),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SampleImageUploadScreenXB1()));
                },
                child: Text("goto Sample image selection screen")),
            SizedBox(height: 40),
            // /
            // /
            // /
            ///
            ElevatedButton(
                onPressed: () async {
                  String? _updateResponse =
                      await ApiOperations.postSection1contents();
                  if (_updateResponse == "success") {
                    Fluttertoast.showToast(msg: "updated to cloud");
                  } else {
                    Fluttertoast.showToast(msg: "failed to update");
                  }
                },
                child: Text("sync")),

            ///
            ///
            ///
            ///
            // ElevatedButton(onPressed: () async {}, child: Text("sync")),
            // ,

            Text(contentsOsSection1),
          ],
        ),
      ),
    );
  }
}
