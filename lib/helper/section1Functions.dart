import 'package:cybersmart/helper/database_functions.dart';
import 'package:cybersmart/model%20classes/section%201/section_1_model_class.dart';

class section1GlobalInstance {
  static late Section1Modelsample1 section1GlobalInstanceVariable;
  static late String section1GlobalInstanceVariableString;

  // returnsection1instance;

  static assignSection1InstanceGlobal() async {
    section1GlobalInstanceVariable =
        await DBFunctions.returnsection1instance("sfdsfdf");
  }
}
