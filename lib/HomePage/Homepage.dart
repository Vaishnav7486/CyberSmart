import 'package:cybersmart/Section%202/Section2Screen.dart';
import 'package:flutter/material.dart';
import '../Const/Colors.dart';
import '../Section 3/section3screen.dart';
import '../Section 4/section4screen.dart';
import '../Section 5/section5screen.dart';
import '../Section 6/section6screen.dart';
import '../Section 7/section7screen.dart';
import '../Section 8/section8screen.dart';
import '../Section 9/section9screen.dart';
import '../Section 1/CERTIFICATE_OF_REGISTRY/Section_1_DetailTab/Section_1_DetailTab.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> numbers = [
    "SECTION 1 ",
    "SECTION 2",
    "SECTION 3",
    "SECTION 4",
    "SECTION 5",
    "SECTION 6",
    "SECTION 7",
    "SECTION 8",
    "SECTION 9",
    "SECTION 10",
    "SECTION 11 ",
    "SECTION 12",
    "SECTION 13",
    "SECTION 14",
    "SECTION 15",
    "SECTION 16",
    "SECTION 17",
    "SECTION 18",
  ];
  int current = 0;
  List data = [
    Section_1_DetailTab(),
    Section2(),
    Section_3(),
    Section4(),
    Section5(),
    Section7(),
    Section8(),
    Section9(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CS_BackgroundColor,
      appBar: AppBar(
        backgroundColor: CS_BackgroundColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: CS_TextleColor)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close, color: CS_TextleColor),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text(
                    "PRE SURVEY",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),

            /// CUSTOM TABBAR
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .035,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numbers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.only(
                          bottom: 5, // space between underline and text
                        ),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: current == index
                              ? CS_TabColor
                              : CS_RectangleColor, // Text colour here
                          width: 4, // Underline width
                        ))),
                        child: Text(
                          numbers[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: current == index
                                  ? CS_TabColor
                                  : CS_RectangleColor, // Text colour here
                              decorationThickness: 5),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),

            /// MAIN BODY
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: CS_BodyContainerColor,
                ),
                child: ListView(children: [
                  data[current],
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
