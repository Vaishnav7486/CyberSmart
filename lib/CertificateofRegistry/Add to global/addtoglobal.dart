import 'package:flutter/material.dart';

import '../../Const/Colors.dart';

class Addtoremark extends StatefulWidget {
  const Addtoremark({super.key});

  @override
  State<Addtoremark> createState() => _AddtoremarkState();
}

class _AddtoremarkState extends State<Addtoremark> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffF0F9F6),
              border: Border.all(
                color: Color.fromARGB(255, 219, 216, 216),
              ),
            ),
            child: Icon(
              Icons.done_rounded,
              color: Colors.green,
              size: 18,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text("Add to global remark", style: CS_Font)
        ],
      ),
    );
  }
}
