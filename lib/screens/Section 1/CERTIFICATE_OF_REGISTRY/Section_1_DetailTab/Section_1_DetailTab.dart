import 'package:cybersmart/helper/database_functions.dart';
import 'package:cybersmart/helper/imageDatabaseHelper.dart';
import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';
import 'package:cybersmart/screens/Section%201/CERTIFICATE_OF_REGISTRY/Add%20to%20global/addtoglobal.dart';
import 'package:cybersmart/screens/Section%201/CERTIFICATE_OF_REGISTRY/UploadImage/uploadImageClass.dart';
import 'package:cybersmart/screens/Section%201/CERTIFICATE_OF_REGISTRY/UploadImage/uploadimage.dart';
import 'package:cybersmart/screens/Section%201/CERTIFICATE_OF_REGISTRY/UploadImage/ImageUploadSection.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../CertificateofRegistry.dart';
import '../../../../Const/Colors.dart';

class Section_1_DetailTab extends StatefulWidget {
  Section_1_DetailTab({super.key, required this.projectID});
  String projectID;

  @override
  State<Section_1_DetailTab> createState() => _Section_TabState();
}

class _Section_TabState extends State<Section_1_DetailTab> {
  final List<String> section1 = [
    "CERTIFICATE OF REGISTRY",
    "ARTICLES OF AGREEMENT (VALID 1 YR)",
    "MINIMUM SAFE MANNING CERTIFICATE",
    "RADIO STATION LICENSE",
    "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE",
    "MS NOTICES FILE",
    "TECHNICAL NOTES",
    "MERCHANT SHIPPING ACT (CAP.234)",
    "MS ACT SUBSIDIARY LEGISLATION",
  ];
  late Section1Modelsample1 _section1ModelInstance;
  late Section1Modelsample1 _section1ModelInstanceHelper;

  @override
  void initState() {
    super.initState();
    initStateFunction();
  }

  initStateFunction() async {
    _section1ModelInstanceHelper = await setValueToSection1InstanceforUI();

    setState(() {
      _section1ModelInstance = _section1ModelInstanceHelper;
      print("printing the initial state setting in the home page screen");
      print(_section1ModelInstance);
    });
  }

  Future<Section1Modelsample1> setValueToSection1InstanceforUI() async {
    Section1Modelsample1 _sampelvalue =
        await DBFunctions.returnsection1instance(widget.projectID);
    return _sampelvalue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Container(
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     print(_section1ModelInstance
            //         .presurveyInfo[0].registryRequirements[0].details.name);
            //   },
            //   child: Container(
            //     height: 60,
            //     width: 120,
            //     color: Colors.green,
            //   ),
            // ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Divider(),
                itemCount: section1.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffD9D9D9),
                    ),
                    height: 68,
                    width: 360,
                    child: ListTile(
                      title: Text(section1[index],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CS_Font),
                      subtitle: Row(
                        children: [
                          Text(
                            completeOrIncompleteStatusCheckingBasedOnFormName(
                                index),
                            style: CS_Font,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                              height: 16,
                              width: 16,
                              child: returnIconAfterCheckingConditaion(index))
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            // builder: (context) => CertificateofRegistryForm(),
                            builder: (context) => CertificateofRegistryForm(
                              projectID: widget.projectID,
                              selectedForm: section1[index],
                            ),
                          ),
                        ),
                        child: Image.asset("images/Icon.png"),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  returnIconAfterCheckingConditaion(index) {
    switch (completeOrIncompleteStatusCheckingBasedOnFormName(index)) {
      case "COMPLETED":
        return Icon(Icons.check, size: 17);
      case "INCOMPLETE":
        return Icon(Icons.cancel, size: 17);
      case "TO BE COMPLETED":
        return Icon(Icons.timer, size: 17);
    }
  }

//  String
  completeOrIncompleteStatusCheckingBasedOnFormName(index) {
    switch (section1[index]) {
      case "CERTIFICATE OF REGISTRY":
        return statusCheckingOfFormCompletionStatus(
            "CERTIFICATE OF REGISTRY", 0);
      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
        return statusCheckingOfFormCompletionStatus(
            "ARTICLES OF AGREEMENT (VALID 1 YR)", 1);
      case "MINIMUM SAFE MANNING CERTIFICATE":
        return statusCheckingOfFormCompletionStatus(
            "MINIMUM SAFE MANNING CERTIFICATE", 2);
      case "RADIO STATION LICENSE":
        return statusCheckingOfFormCompletionStatus("RADIO STATION LICENSE", 3);
      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
        return statusCheckingOfFormCompletionStatus(
            "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE",
            4);
      case "MS NOTICES FILE":
        return statusCheckingOfFormCompletionStatus("MS NOTICES FILE", 5);
      case "TECHNICAL NOTES":
        return statusCheckingOfFormCompletionStatus("TECHNICAL NOTES", 6);
      case "MERCHANT SHIPPING ACT (CAP.234)":
        return statusCheckingOfFormCompletionStatus(
            "MERCHANT SHIPPING ACT (CAP.234)", 7);
      case "MS ACT SUBSIDIARY LEGISLATION":
        return statusCheckingOfFormCompletionStatus(
            "MS ACT SUBSIDIARY LEGISLATION", 8);
    }
    // default:
    return "sherri aavum da";
    // break;
  }

  statusCheckingOfFormCompletionStatus(String statusof, int index) {
    switch (_section1ModelInstance
        .presurveyInfo[0].registryRequirements[index].details.completed) {
      case "yes":
        return "COMPLETED";
      case "no":
        return "INCOMPLETE";
      default:
        return "TO BE COMPLETED";
    }
  }
}

class CertificateofRegistryForm extends StatefulWidget {
  CertificateofRegistryForm(
      {super.key, required this.projectID, required this.selectedForm});
  String projectID;
  String selectedForm;
  @override
  State<CertificateofRegistryForm> createState() =>
      _CertificateofRegistryFormState();
}

class _CertificateofRegistryFormState extends State<CertificateofRegistryForm> {
  late TextEditingController issuedateController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  final TextEditingController _Remark_Textcontroller = TextEditingController();
  bool validator = false;
  String remark_value = "Remarks";
  String issue_date_value = "";
  String expiry_date_value = "";
  String? valid_value = "";
  bool global_remark_value = false;

  @override
  void initState() {
    super.initState();
    // i have removed this - what is the convequence ?
    // expiryDateController.text = "";
    // issuedateController.text = "";
    value = false;
    assignvalueFromDBtosection1instance();
    print("this is the selected form ${widget.selectedForm}");
  }

  assignvalueFromDBtosection1instance() async {
    try {
      section1ModelInstance_helper = await setValueToSection1InstanceforUI();
      setState(() {
        section1ModelInstance = section1ModelInstance_helper;

        switch (widget.selectedForm) {
          case "CERTIFICATE OF REGISTRY":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[0].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[0].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[0].details.expiryDate;

            break;
          case "ARTICLES OF AGREEMENT (VALID 1 YR)":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[1].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[1].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[1].details.expiryDate;

            break;
          case "MINIMUM SAFE MANNING CERTIFICATE":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[2].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[2].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[2].details.expiryDate;

            break;
          case "RADIO STATION LICENSE":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[3].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[3].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[3].details.expiryDate;

            break;
          case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[4].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[4].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[4].details.expiryDate;

            break;
          case "MS NOTICES FILE":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[5].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[5].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[5].details.expiryDate;

            break;
          case "TECHNICAL NOTES":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[6].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[6].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[6].details.expiryDate;

            break;
          case "MERCHANT SHIPPING ACT (CAP.234)":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[7].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[7].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[7].details.expiryDate;

            break;
          case "MS ACT SUBSIDIARY LEGISLATION":
            remark_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[8].details.remarks;
            issue_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[8].details.issueDate;
            expiry_date_value = section1ModelInstance
                .presurveyInfo[0].registryRequirements[8].details.expiryDate;

            break;

          default:
        }
      });
    } catch (e) {
      print("EC while assigning values to remark and related variables as $e");
      throw e;
    }
  }

  Future<Section1Modelsample1> setValueToSection1InstanceforUI() async {
    try {
      Section1Modelsample1 _sampelvalue =
          await DBFunctions.returnsection1instance(widget.projectID);
      return _sampelvalue;
    } catch (e) {
      print("EC while assigning section 1 instance as $e");
      throw e;
    }
  }

  late Section1Modelsample1 section1ModelInstance;
  late Section1Modelsample1 section1ModelInstance_helper;

  String? _chosenValue;
  final section1Formkey = GlobalKey<FormState>();

  bool value = true;
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
//show confirm dialogue =================================================================================================================================================================
      return await showDialog(
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(25),
              child: AlertDialog(
                title: Container(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      "images/Question.png",
                    )),
                content: Text(
                  // this is the one that actually works 
                  'Do you want to mark this check as completed? ath venam da',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // mark 8 - async given on ontap
                          Navigator.of(context).pop(true);
                          String message_updationOfDataToDatabase =
                              await DBFunctions
                                  .saveAndUpdateInstanceOfSection1ToDatabase(
                                      section1ModelInstance);
                          print(message_updationOfDataToDatabase);
                          if (message_updationOfDataToDatabase == "success") {
                            Fluttertoast.showToast(
                                msg: "values updated to database");
                          } else if (message_updationOfDataToDatabase ==
                              "failed") {
                            Fluttertoast.showToast(
                                msg: "failed to update values to database");
                          }
                          
                          //  await ImageDatabaseHelper.saveImagesToDatabase(imagesList);
                        },
                        child: Center(
                          child: Container(
                              height: 50,
                              width: 60,
                              child: Image.asset("images/Normal Button.png")),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(false);
                          // mark 2 yes button - for saving the json string to database
                        },
                        child: Container(
                          height: 50,
                          width: 60,
                          child: Center(
                            child: Image.asset("images/Normal Button (1).png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

//Here Start the Certificate of registry form ====================================================================================================================================
    return WillPopScope(
        onWillPop: showExitPopup, //call function on back button press
        child: Scaffold(
          backgroundColor: CS_BackgroundColor,
          appBar: AppBar(
            backgroundColor: CS_BackgroundColor,
            leading: IconButton(
                onPressed: () {
                  // showExitPopup();
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: CS_TextleColor)),
            elevation: 0,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 15, bottom: 15),
                  child: Text(
                    widget.selectedForm,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  flex: 9,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: CS_BodyContainerColor,
                    ),
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
//Here calling the YES or NO drop Down Button ==================================================================================================================================================================================
                        Column(
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: (_chosenValue == null ||
                                          _chosenValue == 'Please Select')
                                      ? Color(0xffDDE2E5)
                                      : (_chosenValue == 'NO')
                                          ? Color(0xffFCF3F2)
                                          : Color(0xffF0F9F6),
                                ),
                                height: 72,
                                width: 375,
                                child: ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Valid",
                                      style: TextStyle(
                                          color: (_chosenValue == null ||
                                                  _chosenValue ==
                                                      'Please Select')
                                              ? Color.fromARGB(255, 56, 56, 56)
                                              : (_chosenValue == 'NO')
                                                  ? Color.fromARGB(
                                                      255, 240, 24, 0)
                                                  : Color.fromARGB(
                                                      255, 3, 180, 77),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  subtitle: DropdownButton<String>(
                                    icon: Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .52,
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          size: 35,
                                        ),
                                      ],
                                    ),
                                    underline: SizedBox(),
                                    value: _chosenValue,
                                    style: TextStyle(color: Color(0xff5E6366)),
                                    items: <String>[
                                      'Please Select',
                                      'YES',
                                      'NO',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      validStateHintTextReturningFunction() ??
                                          "Please select",
                                      style: CS_Font,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _chosenValue = value!;
                                      });
                                      setState(() {
                                        valid_value = value;
                                        // mark 4 - valid dropdown
                                        switch (widget.selectedForm) {
                                          case "CERTIFICATE OF REGISTRY":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[0]
                                                .details
                                                .valid = value;

                                            break;
                                          case "ARTICLES OF AGREEMENT (VALID 1 YR)":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[1]
                                                .details
                                                .valid = value;
                                            break;
                                          case "MINIMUM SAFE MANNING CERTIFICATE":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[2]
                                                .details
                                                .valid = value;
                                            break;
                                          case "RADIO STATION LICENSE":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[3]
                                                .details
                                                .valid = value;
                                            break;
                                          case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[4]
                                                .details
                                                .valid = value;
                                            break;
                                          case "MS NOTICES FILE":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[5]
                                                .details
                                                .valid = value;
                                            break;
                                          case "TECHNICAL NOTES":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[6]
                                                .details
                                                .valid = value;
                                            break;
                                          case "MERCHANT SHIPPING ACT (CAP.234)":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[7]
                                                .details
                                                .valid = value;
                                            break;
                                          case "MS ACT SUBSIDIARY LEGISLATION":
                                            section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[8]
                                                .details
                                                .valid = value;
                                            break;
                                          default:
                                            print(
                                                "ERROR WHILE SETTING VALUE TO VALID STATE - XC29");
                                            break;
                                        }
                                      });
                                      print(valid_value);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: section1Formkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffDDE2E5)),
                                    height: 58,
                                    width: 375,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: TextField(
                                        style: TextStyle(color: CS_TextleColor),
                                        controller: issuedateController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.calendar_month_outlined,
                                            // Icons.abc,
                                            color: Color(0xff000000),
                                          ),
                                          labelText:
                                              IssueDateHintTextReturningFunction()
                                          // "issue date"
                                          //     ??
                                          // "Issue date",
                                          ,
                                          errorText: validator
                                              ? 'Value be Empty'
                                              : null,
                                          labelStyle: TextStyle(
                                            color: Color(
                                                0xff000000), //<-- SEE HERE
                                          ),
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2101),
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            ColorScheme.light(
                                                          primary:
                                                              CS_ButtonColor, // header background color
                                                          onPrimary: Colors
                                                              .white, // header text color
                                                          onSurface: Color.fromARGB(
                                                              255,
                                                              38,
                                                              102,
                                                              71), // body text color
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary:
                                                                CS_ButtonColor, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  });
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat("dd-MM-yyyy")
                                                    .format(pickedDate);
                                            setState(() {
                                              // mark 5 - issue date selection
                                              // issuedateController.text , '
                                              issue_date_value =
                                                  formattedDate.toString();
                                              issue_date_value =
                                                  formattedDate.toString();
                                              switch (widget.selectedForm) {
                                                case "CERTIFICATE OF REGISTRY":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[0]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();

                                                  break;
                                                case "ARTICLES OF AGREEMENT (VALID 1 YR)":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[1]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MINIMUM SAFE MANNING CERTIFICATE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[2]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "RADIO STATION LICENSE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[3]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[4]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MS NOTICES FILE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[5]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "TECHNICAL NOTES":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[6]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MERCHANT SHIPPING ACT (CAP.234)":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[7]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MS ACT SUBSIDIARY LEGISLATION":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[8]
                                                          .details
                                                          .issueDate =
                                                      formattedDate.toString();
                                                  break;
                                                default:
                                                  print(
                                                      "ERROR WHILE SETTING VALUE TO REMARK - XC29");
                                                  break;
                                              }
                                            });

                                            print(issue_date_value);
                                          } else {}
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffDDE2E5)),
                                    height: 58,
                                    width: 375,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: TextField(
                                        style: TextStyle(color: CS_TextleColor),
                                        controller: expiryDateController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            Icons.calendar_month_outlined,
                                            color: Color(0xff000000),
                                          ),
                                          labelText:
                                              ExpiryDateHintTextReturningFunction()
                                          // "expiry date"
                                          // "expiry date"
                                          //     ??
                                          // "Expiry Date",
                                          ,
                                          labelStyle: TextStyle(
                                            color: Color(
                                                0xff000000), //<-- SEE HERE
                                          ),
                                        ),
                                        readOnly: true,
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2000),
                                                  lastDate: DateTime(2101),
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            ColorScheme.light(
                                                          primary:
                                                              CS_ButtonColor, // header background color
                                                          onPrimary: Colors
                                                              .white, // header text color
                                                          onSurface: Color.fromARGB(
                                                              255,
                                                              38,
                                                              102,
                                                              71), // body text color
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary:
                                                                CS_ButtonColor, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  });
                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat("dd-MM-yyyy")
                                                    .format(pickedDate);
                                            setState(() {
                                              // mark 6 - expiry date selection
                                              // expiryDateController.text =
                                              //     formattedDate.toString();
                                              // expiryDateController.text =
                                              expiry_date_value =
                                                  formattedDate.toString();
                                              switch (widget.selectedForm) {
                                                case "CERTIFICATE OF REGISTRY":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[0]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();

                                                  break;
                                                case "ARTICLES OF AGREEMENT (VALID 1 YR)":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[1]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MINIMUM SAFE MANNING CERTIFICATE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[2]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "RADIO STATION LICENSE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[3]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[4]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MS NOTICES FILE":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[5]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "TECHNICAL NOTES":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[6]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MERCHANT SHIPPING ACT (CAP.234)":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[7]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                case "MS ACT SUBSIDIARY LEGISLATION":
                                                  section1ModelInstance
                                                          .presurveyInfo[0]
                                                          .registryRequirements[8]
                                                          .details
                                                          .expiryDate =
                                                      formattedDate.toString();
                                                  break;
                                                default:
                                                  print(
                                                      "ERROR WHILE SETTING VALUE TO Expiry date - XC29");
                                                  break;
                                              }
                                            });
                                            print(expiry_date_value);
                                          } else {
                                            print("Not selected");
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: (_Remark_Textcontroller.text ==
                                                "")
                                            ? Color.fromARGB(255, 56, 56, 56)
                                            : (_Remark_Textcontroller.text ==
                                                    "")
                                                ? Color.fromARGB(
                                                    255, 240, 24, 0)
                                                : Color.fromARGB(
                                                    255, 3, 180, 77),
                                      ),
                                    ),
                                    height: 136,
                                    width: 375,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: TextFormField(
                                        onChanged: (value) {
                                          setState(() {
                                            switch (widget.selectedForm) {
                                              case "CERTIFICATE OF REGISTRY":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[0]
                                                    .details
                                                    .remarks = value;

                                                break;
                                              case "ARTICLES OF AGREEMENT (VALID 1 YR)":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[1]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              case "MINIMUM SAFE MANNING CERTIFICATE":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[2]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              case "RADIO STATION LICENSE":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[3]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[4]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              case "MS NOTICES FILE":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[5]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              case "TECHNICAL NOTES":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[6]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              case "MERCHANT SHIPPING ACT (CAP.234)":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[7]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              case "MS ACT SUBSIDIARY LEGISLATION":
                                                section1ModelInstance
                                                    .presurveyInfo[0]
                                                    .registryRequirements[8]
                                                    .details
                                                    .remarks = value;
                                                break;
                                              default:
                                                print(
                                                    "ERROR WHILE SETTING VALUE TO VALID STATE - XC29");
                                                break;
                                            }
                                          });
                                          print(value);
                                        },
                                        minLines: 1,
                                        maxLines: 5,
                                        keyboardType: TextInputType.multiline,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              remarkHintTextReturningFunction(),
                                          hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 56, 56, 56)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
//Here calling  remark ==================================================================================================================================================================================
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    value = !value;
                                    global_remark_value = value;
                                    print(global_remark_value);
                                    switch (widget.selectedForm) {
                                      case "CERTIFICATE OF REGISTRY":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[0]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;

                                        break;
                                      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[1]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      case "MINIMUM SAFE MANNING CERTIFICATE":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[2]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      case "RADIO STATION LICENSE":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[3]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[4]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      case "MS NOTICES FILE":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[5]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      case "TECHNICAL NOTES":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[6]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      case "MERCHANT SHIPPING ACT (CAP.234)":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[7]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      case "MS ACT SUBSIDIARY LEGISLATION":
                                        section1ModelInstance
                                                .presurveyInfo[0]
                                                .registryRequirements[8]
                                                .details
                                                .globalRemarks =
                                            global_remark_value;
                                        break;
                                      default:
                                        print(
                                            "ERROR WHILE SETTING VALUE TO VALID STATE - XC29");
                                        break;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffF0F9F6),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 219, 216, 216),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.done_rounded,
                                    color: (value == null)
                                        ? Color.fromARGB(255, 175, 78, 76)
                                        : (value == true)
                                            ? Colors.green
                                            : Color(0xffF0F9F6),
                                    size: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Add to global remark", style: CS_Font)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
//Here calling the Upload Screen ==================================================================================================================================================================================
                        // Uploadimage(),
                        // Container(
                        //   height: 40,
                        //   width: 45,
                        //   color: Colors.yellow,
                        //   child: ElevatedButton(
                        //       onPressed: () {
                        //         print(section1ModelInstance.presurveyInfo[0]
                        //             .registryRequirements[2].details.name);
                        //       },
                        //       child: Text("press this")),
                        // )
                        ///
                        ///
                        ///
                        ///
                        ///concentrate from here
                        ///
                        ///
                        ///
                        ImageUploadSection(
                            section1Instance: section1ModelInstance,
                            formName: widget.selectedForm),
                        // UploadImageClass(
                        //   selectedForm: widget.selectedForm,
                        //   // imageListParam: section1ModelInstance.presurveyInfo[0]
                        //   //     .registryRequirements[0].details.attachments,
                        //   section1instance: section1ModelInstance,
                        // )
                      ],
                    ),
                  ),
                ),
//Here calling the save Button ====================================================================================================================================
                Container(
                  color: CS_BodyContainerColor,

                  // this center was wrapped with expanded
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CS_BodyContainerColor,
                      ),
                      height: 58,
                      width: 375,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff4AA080),
                            foregroundColor: CS_BodyContainerColor),
                        onPressed: () {
                          showExitPopup();
                        },
                        child: Center(
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  remarkHintTextReturningFunction() {
    switch (widget.selectedForm) {
      case "CERTIFICATE OF REGISTRY":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[0].details.remarks;
        break;
      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[1].details.remarks;
        break;
      case "MINIMUM SAFE MANNING CERTIFICATE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[2].details.remarks;
        break;
      case "RADIO STATION LICENSE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[3].details.remarks;
        break;
      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[4].details.remarks;
        break;
      case "MS NOTICES FILE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[5].details.remarks;
        break;
      case "TECHNICAL NOTES":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[6].details.remarks;
        break;
      case "MERCHANT SHIPPING ACT (CAP.234)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[7].details.remarks;
        break;
      case "MS ACT SUBSIDIARY LEGISLATION":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[8].details.remarks;
        break;
    }
  }

  String? ValidStateHintTextReturningFunction() {
    switch (widget.selectedForm) {
      case "CERTIFICATE OF REGISTRY":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[0].details.valid;
        break;
      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[1].details.valid;
        break;
      case "MINIMUM SAFE MANNING CERTIFICATE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[2].details.valid;
        break;
      case "RADIO STATION LICENSE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[3].details.valid;
        break;
      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[4].details.valid;
        break;
      case "MS NOTICES FILE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[5].details.valid;
        break;
      case "TECHNICAL NOTES":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[6].details.valid;
        break;
      case "MERCHANT SHIPPING ACT (CAP.234)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[7].details.valid;
        break;
      case "MS ACT SUBSIDIARY LEGISLATION":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[8].details.valid;
        break;
      default:
        return "this is a default case for valid state";
    }
  }

  String IssueDateHintTextReturningFunction() {
    switch (widget.selectedForm) {
      case "CERTIFICATE OF REGISTRY":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[0].details.issueDate;
        break;
      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[1].details.issueDate;
        break;
      case "MINIMUM SAFE MANNING CERTIFICATE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[2].details.issueDate;
        break;
      case "RADIO STATION LICENSE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[3].details.issueDate;
        break;
      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[4].details.issueDate;
        break;
      case "MS NOTICES FILE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[5].details.issueDate;
        break;
      case "TECHNICAL NOTES":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[6].details.issueDate;
        break;
      case "MERCHANT SHIPPING ACT (CAP.234)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[7].details.issueDate;
        break;
      case "MS ACT SUBSIDIARY LEGISLATION":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[8].details.issueDate;
        break;
      default:
        return "this is a default case for issue date";
    }
  }

  String ExpiryDateHintTextReturningFunction() {
    switch (widget.selectedForm) {
      case "CERTIFICATE OF REGISTRY":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[0].details.expiryDate;
        break;
      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[1].details.expiryDate;
        break;
      case "MINIMUM SAFE MANNING CERTIFICATE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[2].details.expiryDate;
        break;
      case "RADIO STATION LICENSE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[3].details.expiryDate;
        break;
      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[4].details.expiryDate;
        break;
      case "MS NOTICES FILE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[5].details.expiryDate;
        break;
      case "TECHNICAL NOTES":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[6].details.expiryDate;
        break;
      case "MERCHANT SHIPPING ACT (CAP.234)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[7].details.expiryDate;
        break;
      case "MS ACT SUBSIDIARY LEGISLATION":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[8].details.expiryDate;
        break;
      default:
        return "this is a default case for expiry date";
    }
  }

  String? validStateHintTextReturningFunction() {
    switch (widget.selectedForm) {
      case "CERTIFICATE OF REGISTRY":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[0].details.valid;
        break;
      case "ARTICLES OF AGREEMENT (VALID 1 YR)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[1].details.valid;
        break;
      case "MINIMUM SAFE MANNING CERTIFICATE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[2].details.valid;
        break;
      case "RADIO STATION LICENSE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[3].details.valid;
        break;
      case "MALTESE SHIPS OFFICIAL LOG BOOK WITH REGULAR INSPECTION ENTRIES FOR DRILLS/ACCOMODATION/LSA/FFE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[4].details.valid;
        break;
      case "MS NOTICES FILE":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[5].details.valid;
        break;
      case "TECHNICAL NOTES":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[6].details.valid;
        break;
      case "MERCHANT SHIPPING ACT (CAP.234)":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[7].details.valid;
        break;
      case "MS ACT SUBSIDIARY LEGISLATION":
        return section1ModelInstance
            .presurveyInfo[0].registryRequirements[8].details.valid;
        break;
      default:
        return "this is a default case for expiry date";
    }
  }
}
