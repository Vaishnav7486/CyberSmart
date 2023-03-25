import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../CertificateofRegistry.dart';
import '../../../Const/Colors.dart';

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
                        builder: (context) => CertificateofRegistryForm(),
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
