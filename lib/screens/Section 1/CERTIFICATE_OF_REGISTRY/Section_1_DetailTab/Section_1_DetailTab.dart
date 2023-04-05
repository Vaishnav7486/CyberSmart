import 'package:cybersmart/screens/Section%201/CERTIFICATE_OF_REGISTRY/Add%20to%20global/addtoglobal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CertificateofRegistry.dart';
import '../../../../Const/Colors.dart';

class Section_1_DetailTab extends StatefulWidget {
  const Section_1_DetailTab({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Container(
        child: ListView.separated(
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
                        "INCOMPLETE",
                        style: CS_Font,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                          height: 16,
                          width: 16,
                          child: Image.asset("images/close cross.png"))
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        // builder: (context) => CertificateofRegistryForm(),
                        builder: (context) => CORSampleForm1(),
                      ),
                    ),
                    child: Image.asset("images/Icon.png"),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

///certificate of registary sample form

class CORSampleForm1 extends StatefulWidget {
  const CORSampleForm1({super.key});

  @override
  State<CORSampleForm1> createState() => _CORSampleForm1State();
}

class _CORSampleForm1State extends State<CORSampleForm1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            AddtoremarkN(),
          ],
        ),
      ),
    );
  }
}



class AddtoremarkN extends StatefulWidget {
  const AddtoremarkN({super.key});

  @override
  State<AddtoremarkN> createState() => _AddtoremarkNState();
}

class _AddtoremarkNState extends State<AddtoremarkN> {
  @override
  void initState() {
    value = false;
    super.initState();
  }

  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                value = !value;
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
          Text("Add to global remark", style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
