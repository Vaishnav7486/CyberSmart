import 'package:flutter/material.dart';

class Section7 extends StatefulWidget {
  const Section7({super.key});

  @override
  State<Section7> createState() => _Section7State();
}

class _Section7State extends State<Section7> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Container(
        child: Center(
          child: Text(
            "Section 2",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
