import 'package:flutter/material.dart';

class Section4 extends StatefulWidget {
  const Section4({super.key});

  @override
  State<Section4> createState() => _Section4State();
}

class _Section4State extends State<Section4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Container(
        child: Center(
          child: Text(
            "Section 4",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
