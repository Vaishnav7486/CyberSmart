import 'package:flutter/material.dart';

import '../../CertificateofRegistry/CertificateofRegistry.dart';
import '../../Const/Colors.dart';

class Section_1_DetailTab extends StatefulWidget {
  const Section_1_DetailTab({super.key});

  @override
  State<Section_1_DetailTab> createState() => _Section_TabState();
}

class _Section_TabState extends State<Section_1_DetailTab> {
  final List<String> section1 = [
    "Certificate of Registry",
    "Articles of Agreement (valid 1 yr)",
    "Minimum Safe Manning Certificate",
    "Radio Station License",
    "Maltese Ships Official Log Book with regular inspection entries for drills/accomodation/LSA/FFE",
    "MS Notices File",
    "Technical Notes",
    "Merchant Shipping Act (Cap.234)",
    "MS Act Subsidiary Legislation",
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Container(
        height: MediaQuery.of(context).size.height * .035,
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: section1.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffD9D9D9),
                ),
                height: 70,
                width: 360,
                child: ListTile(
                    title: Text(
                      section1[index],
                      style: TextStyle(
                          color: CS_TextleColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          "Valid",
                          style: TextStyle(
                              color: CS_TextleColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset("images/loading.png")
                      ],
                    ),
                    trailing: InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    CertificateofRegistryForm())),
                        child: Image.asset("images/Icon.png"))),
              );
            }),
      ),
    );
  }
}
