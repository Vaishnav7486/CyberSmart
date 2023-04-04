import 'package:flutter/material.dart';

class Section_3 extends StatefulWidget {
  const Section_3({super.key});

  @override
  State<Section_3> createState() => _Section_3State();
}

class _Section_3State extends State<Section_3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Container(
        child: Center(
          child: Text(
            "Section 3",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
