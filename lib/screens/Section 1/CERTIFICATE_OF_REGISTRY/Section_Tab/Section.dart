import 'package:flutter/material.dart';

import '../../../../Const/Colors.dart';

class Section_Tab1 extends StatefulWidget {
  const Section_Tab1({super.key});

  @override
  State<Section_Tab1> createState() => _Section_TabState();
}

class _Section_TabState extends State<Section_Tab1> {
  int current = 0;
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
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
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
          }),
    );
  }
}
