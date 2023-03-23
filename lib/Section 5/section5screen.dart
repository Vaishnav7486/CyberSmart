import 'package:flutter/material.dart';

class Section5 extends StatefulWidget {
  const Section5({super.key});

  @override
  State<Section5> createState() => _Section5State();
}

class _Section5State extends State<Section5> {
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
