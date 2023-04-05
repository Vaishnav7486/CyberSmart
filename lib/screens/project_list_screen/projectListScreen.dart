import 'package:cybersmart/HomePage/Homepage.dart';
import 'package:cybersmart/helper/database_functions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Homepage(
                              projectID: "9lishnnv",
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
                      "Project Id : 9lishnnv",
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
            ///add projec to database
            ///
            ///
            // ElevatedButton(
            //     onPressed: () async {
            //       String isSuccess =
            //           await DBFunctions.addProjectToDatabaseSampl();
            //       if (isSuccess == "success") {
            //         Fluttertoast.showToast(msg: "Project added to database");
            //       } else if (isSuccess == "failed") {
            //         Fluttertoast.showToast(msg: "Failed to add project");
            //       }
            //     },
            //     child: Text("create new project with id 9lishnnv")),

            ///
            ///
            ///print all contents of database
            ///
            ///
            // ElevatedButton(
            //     onPressed: () {
            //       DBFunctions.printAllContentsofDatabase();
            //     },
            //     child: Text("print contents of database")),

            ///
            ///
            ///
            ///delete all contenets from database
            ///
            ///
            ///
            // ElevatedButton(
            //     onPressed: () {
            //     ///  DBFunctions.deleteAllcontentsFromDatabase();
            //     },
            //     child: Text("delete all data from database"))

            ///
            ///
            ///
            // ElevatedButton(
            //     onPressed: () {
            //       DBFunctions.pushSampleDataToSection1();
            //     },
            //     child: Text("set sample data to section 1"))
          ],
        ),
      ),
    );
  }
}
