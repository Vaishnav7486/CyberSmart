import 'package:flutter/material.dart';

class Section6 extends StatefulWidget {
  const Section6({super.key});

  @override
  State<Section6> createState() => _Section6State();
}

class _Section6State extends State<Section6> {
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
