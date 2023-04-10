import 'dart:convert';

import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:sqflite/sqflite.dart';

class DBFunctions {
  static late Database _db;
  static Future<void> initializeDataBase() async {
    try {
      _db = await openDatabase(
        "projects.db",
        version: 1,
        onCreate: (db, version) {
          db.execute("""
    CREATE TABLE projects (
     id INTEGER PRIMARY KEY,
     project_name TEXT,
     project_id TEXT,
     section_1 TEXT,
     section_2 TEXT,
     section_3 TEXT,
     section_4 TEXT,
     section_5 TEXT,
     section_6 TEXT,
     section_7 TEXT,
     section_8 TEXT,
     section_9 TEXT,
     section_10 TEXT,
     section_11 TEXT,
     section_12 TEXT,
     section_13 TEXT,
     section_14 TEXT,
     section_15 TEXT,
     section_16 TEXT,
     section_17 TEXT,
     section_18 TEXT)
     """);
        },
      );

      /// remove this print later
      print("created database");
    } catch (e) {
      print("EC - while creating table as $e");
      throw e;
    }
  }

  static Future<String> addProjectToDatabaseSampl() async {
    String projectID = "c0vn17t9";
    String projectName = "sample project";
    try {
      await DBFunctions._db.rawInsert("""
INSERT INTO projects (project_name,project_id) VALUES (?,?)""",
          [projectName, projectID]);
      return "success";
    } catch (e) {
      print("EC - while adding project to DB as $e");
      return "failed";
      // throw e;
    }
  }

  static Future printAllContentsofDatabase() async {
    try {
      var valuesFromDB =
          await DBFunctions._db.rawQuery("SELECT * FROM projects");
      print(valuesFromDB);
    } catch (e) {
      print("EC as $e");
      throw e;
    }
  }

  static Future deleteAllcontentsFromDatabase() async {
    try {
      await DBFunctions._db.execute("DELETE FROM projects");
    } catch (e) {
      print("EC as $e");
      throw e;
    }
  }

  static Future pushSampleDataToSection1() async {
    String project_id = "c0vn17t9";
    String section1SampleDataString = """{
    "project_id": "c0vn17t9",
    "check_id": "",
    "presurvey_info": [
        {
            "registry_requirements": [
                {
                    "details": {
                        "no": "1",
                        "attachments": [
                            {
                                "details": {
                                    "filename": "7173-CAPE_DANCER_SA4482.jpg",
                                    "filetype": "image/jpeg",
                                    "globalAttachments": true,
                                    "name": "tedst",
                                    "PointId": "1",
                                    "RemarkofFile": "ksksks",
                                    "SectionId": "1"
                                },
                                "id": 1
                            },
                            {
                                "id" : 2,
                                "details": {
                                    "filename": "7173-CAPE_DANCER_SA4482.jpg",
                                    "filetype": "image/jpeg",
                                    "globalAttachments": true,
                                    "name": "tedst",
                                    "PointId": "1",
                                    "RemarkofFile": "ksksks",
                                    "SectionId": "1"
                                }
                            }
                        ],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "Yes",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "completed": "yes",
                        "name": "Certificate of Registry",
                        "remarks": "from web app"
                    },
                    "id": "1"
                },
                {
                    "details": {
                        "no": "2",
                        "attachments": [],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "Yes",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "completed": "yes",
                        "name": "Articles of Agreement (valid 1 yr)",
                        "remarks": "from web app"
                    },
                    "id": "2"
                },
                {
                    "details": {
                        "no": "3",
                        "attachments": [],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "NO",
                        "globalRemarks": false,
                        "completed": "yes",
                        "issue_date": "null",
                        "name": "Minimum Safe Manning Certificate",
                        "remarks": "from web app"
                    },
                    "id": "3"
                },
                {
                    "details": {
                        "no": "4",
                        "attachments": [],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "completed": "yes",
                        "valid": "NO",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "name": "Radio Station License",
                        "remarks": "from web app"
                    },
                    "id": "4"
                },
                {
                    "details": {
                        "no": "5",
                        "attachments": [],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "NO",
                        "completed": "yes",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "name": "Maltese Ships Official Log Book with regular inspection entries for drills/accomodation/LSA/FFE",
                        "remarks": "from web app"
                    },
                    "id": "5"
                },
                {
                    "details": {
                        "no": "6",
                        "attachments": [],
                        "expiry_date": "null",
                        "last_notice": "",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "Yes",
                        "completed": "yes",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "name": "MS Notices File",
                        "remarks": "from web app"
                    },
                    "id": "6"
                },
                {
                    "details": {
                        "no": "7",
                        "attachments": [],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "",
                        "completed": "yes",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "name": "Technical Notices",
                        "remarks": "from web app"
                    },
                    "id": "7"
                },
                {
                    "details": {
                        "no": "8",
                        "attachments": [],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "Yes",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "completed": "yes",
                        "name": "Merchant Shipping Act (Cap.234)",
                        "remarks": "from web app"
                    },
                    "id": "8"
                },
                {
                    "details": {
                        "no": "9",
                        "attachments": [],
                        "expiry_date": "null",
                        "next_survey_date": "null",
                        "globalAttachments": false,
                        "last_survey_date": "null",
                        "valid": "Yes",
                        "globalRemarks": false,
                        "issue_date": "null",
                        "completed": "yes",
                        "name": "MS Act Subsidiary Legislation",
                        "remarks": "from web app"
                    },
                    "id": "9"
                }
            ]
        }
    ]
}""";
    try {
      await DBFunctions._db.rawUpdate(
          "UPDATE projects SET section_1 = ? where project_id = ?",
          // [mapOfSection1Data, project_id]);
          [section1SampleDataString, project_id]);
      print("section 1 sample data added to database");
    } catch (e) {
      print("EXCEPTION CAUGHT WHILE UPDATING VALUE AS $e");
    }
  }

//  Future <Section1Modelsample1>
  static Future<Section1Modelsample1> returnsection1instance(
      String projectID) async {
    var section1DataFromDB;
    late String section1InstancesString;
    late Section1Modelsample1 instanceOfSection1DataFromDB;
    try {
      section1DataFromDB = await DBFunctions._db.rawQuery(
          "SELECT section_1 from projects WHERE project_id = ?", [projectID]);
      // print(section1DataFromDB);
      // mark 7 - remove this print statement
      section1InstancesString = section1DataFromDB[0]["section_1"] as String;
      // mark 8 - remove this print statement
      // print(section1InstancesString);
    } catch (e) {
      print("EC - WHILE PRINTING DATA OF SECTION 1 AS $e");
    }
    try {
      instanceOfSection1DataFromDB =
          section1Modelsample1FromJson(section1InstancesString);
      // print(instanceOfSection1DataFromDB);
      return instanceOfSection1DataFromDB;
    } catch (e) {
      print("EC - WHILE RETURNING  as $e");
      throw e;
    }
  }

  static late String section1jsonStringToStoreInDatabase;
  static Future<String> saveAndUpdateInstanceOfSection1ToDatabase(
      Section1Modelsample1 section1instance) async {
    String project_id = "c0vn17t9";
    print("this is the instance to store in the section1\n$section1instance");
    section1jsonStringToStoreInDatabase = jsonEncode(section1instance);
    try {
      print(
          "this is the string passed to save\n$section1jsonStringToStoreInDatabase");
      await DBFunctions._db.rawUpdate(
          "UPDATE projects SET section_1 = ? where project_id = ?",
          // [mapOfSection1Data, project_id]);
          [section1jsonStringToStoreInDatabase, project_id]);
      return "success";
    } catch (e) {
      return "failed";
    }

    ///
    ///
  }

  static Future<Section1Modelsample1> returnSection1Object() async {
    var tempt_secction1DataFromDB;
    late String temp_section1InstancesString;
    late Section1Modelsample1 temp_instanceOfSection1DataFromDB;
    try {
      tempt_secction1DataFromDB = await DBFunctions._db.rawQuery(
          "SELECT section_1 from projects WHERE project_id = ?", ["c0vn17t9"]);
      temp_section1InstancesString =
          tempt_secction1DataFromDB[0]["section_1"] as String;
      // print("printing the temporary instance \n $temp_section1InstancesString");
    } catch (e) {
      print("EC - WHILE PRINTING DATA OF SECTION 1 AS $e");
      throw (e);
    }
    try {
      temp_instanceOfSection1DataFromDB =
          section1Modelsample1FromJson(temp_section1InstancesString);
      return temp_instanceOfSection1DataFromDB;
    } catch (e) {
      print("EC - WHILE RETURNING section 1 instance as $e");
      throw (e);
    }
  }
}

// class Section1GlobalInstance =


