import 'package:flutter/material.dart';

class Section9 extends StatefulWidget {
  const Section9({super.key});

  @override
  State<Section9> createState() => _Section9State();
}

class _Section9State extends State<Section9> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Container(
        child: Center(
          child: Text(
            "Section 5",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
