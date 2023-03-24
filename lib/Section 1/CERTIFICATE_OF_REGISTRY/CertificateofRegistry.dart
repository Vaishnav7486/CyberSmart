import 'package:flutter/material.dart';
import '../../Const/Colors.dart';
import 'Add to global/addtoglobal.dart';
import 'DropDownButton/DropDown.dart';
import 'UploadImage/uploadimage.dart';

class CertificateofRegistryForm extends StatefulWidget {
  const CertificateofRegistryForm({super.key});
  @override
  State<CertificateofRegistryForm> createState() =>
      _CertificateofRegistryFormState();
}

class _CertificateofRegistryFormState extends State<CertificateofRegistryForm> {
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      //show confirm dialogue ===============================================================================================================
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
                  'Do you want to mark this check as completed?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(true);
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

//Here Start the Certificate of regisry form ====================================================================================================================================
    return WillPopScope(
        onWillPop: showExitPopup, //call function on back button press
        child: Scaffold(
          backgroundColor: CS_BackgroundColor,
          appBar: AppBar(
            backgroundColor: CS_BackgroundColor,
            leading: IconButton(
                onPressed: () {
                  showExitPopup();
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
                    "CERTIFICATE OF REGISTRY",
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
                        //Here calling the YES or NO drop Down Button ====================================================================================================================================
                        DropDown(),
                        SizedBox(
                          height: 25,
                        ),
//Here calling  remark ====================================================================================================================================
                        Addtoremark(),
                        SizedBox(
                          height: 40,
                        ),
//Here calling the Upload Screen ====================================================================================================================================
                        Uploadimage(),
                      ],
                    ),
                  ),
                ),
//Here calling the save Button ====================================================================================================================================
                Container(
                  color: CS_BodyContainerColor,
                  child: Expanded(
                    flex: 1,
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
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(fontSize: 18),
                            ),
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
}
