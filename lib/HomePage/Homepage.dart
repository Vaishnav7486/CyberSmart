import 'package:flutter/material.dart';

import '../Const/Colors.dart';
import 'Section_1_DetailTab/Section_1_DetailTab.dart';
import 'Section_Tab/Section.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
    Icons.post_add,
    Icons.local_activity,
    Icons.settings,
    Icons.person
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              "PRE SURVAY",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Section_Tab1(),
          SizedBox(
            height: 36,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: CS_BodyContainerColor,
            ),
            height: double.infinity,
            child: Section_1_DetailTab(),
          ))
        ],
      ),
    );
  }
}
