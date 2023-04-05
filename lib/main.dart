import 'package:cybersmart/helper/database_functions.dart';
import 'package:flutter/material.dart';
import 'package:cybersmart/screens/project_list_screen/projectListScreen.dart';

import 'HomePage/Homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DBFunctions.initializeDataBase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: ProjectListScreen());
  }
}
