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
    String projectID = "9lishnnv";
    String projectName = "9lishnnv";
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
    String project_id = "9lishnnv";
    String section1SampleDataString = """{
    "project_id": "9lishnnv",
    "check_id": "",
    "presurvey_info": [
        {
            "registry_requirements": [
                {
                    "id": "1",
                    "details": {
                        "no": "1",
                        "name": "Certificate of Registry",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": [
                            {
                                "id": "",
                                "details": {
                                    "Remark": "",
                                    "SectionId": "",
                                    "PointId": ""
                                }
                            }
                        ],
                        "globalAttachments": false,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "2",
                    "details": {
                        "no": "2",
                        "name": "Articles of Agreement",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": true,
                        "globalAttachments": false,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "3",
                    "details": {
                        "no": "3",
                        "name": "Minimum Safe Manning Certificate",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": true,
                        "globalAttachments": false,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "4",
                    "details": {
                        "no": "4",
                        "name": "Radio Station License",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": false,
                        "globalAttachments": false,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "5",
                    "details": {
                        "no": "5",
                        "name": "Maltese Ships Official Log Book",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": false,
                        "globalAttachments": false,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "6",
                    "details": {
                        "no": "6",
                        "name": "MS Notices File",
                        "last_notice": "168/22",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": true,
                        "globalAttachments": true,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "7",
                    "details": {
                        "no": "7",
                        "name": "Technical Notes",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": false,
                        "globalAttachments": true,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "8",
                    "details": {
                        "no": "8",
                        "name": "Merchant Shipping Act (Cap.234)",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": true,
                        "globalAttachments": false,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
                },
                {
                    "id": "9",
                    "details": {
                        "no": "9",
                        "name": "MS Act Subsidiary Legislation",
                        "valid": "",
                        "issue_date": "",
                        "expiry_date": "",
                        "last_survey_date": "",
                        "next_survey_date": "",
                        "remarks": "",
                        "globalRemarks": true,
                        "globalAttachments": false,
                        "attachments": [
                            {
                                "id": "1",
                                "details": {
                                    "filename": "Nameoffile.extension",
                                    "filetype": "",
                                    "RemarkofFile": "",
                                    "globalAttachments": ""
                                }
                            }
                        ]
                    }
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
}
