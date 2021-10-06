import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/core/utils/constants.dart';

class FinishService {
  String buildJson(List<JsonFields> jsons) {
    String finalJson = "{\n";
    var openBrakets = 0;

    for (int i = 0; i < jsons.length; i++) {
      var space = " " * 5;
      if (jsons[i].mainJson == null || !jsons[i].mainJson!) {
        if (i > 0 &&
            !(jsons[i].fatherObjectName == jsons[i - 1].fatherObjectName)) {
          space = " " * 15;
        }

        if (jsons[i].type == Constants.TYPE_OBJECT) {
          openBrakets += 1;
          if (i > 0 &&
              !(jsons[i].fatherObjectName == jsons[i - 1].fatherObjectName)) {
            space = " " * 15;
          }
          finalJson += space + "\"${jsons[i].name}\": {\n";
          if (jsons.length > i + 1 &&
              (jsons[i].name != jsons[i + 1].fatherObjectName)) {
            finalJson += "}\n";
            openBrakets -= 1;
          }
        } else {
          if (i > 0 &&
              !(jsons[i].fatherObjectName == jsons[i - 1].fatherObjectName)) {
            space += " " * 15;
          }
          if (jsons[i].type == Constants.TYPE_STRING) {
            finalJson +=
                space + "\"${jsons[i].name}\": \"${jsons[i].content}\"";
          } else {
            finalJson += space + "\"${jsons[i].name}\": ${jsons[i].content}";
          }
          if (jsons.length > i + 1) {
            finalJson += ",\n";
          }
        }
      }
    }
    if (openBrakets != 0) {
      finalJson += "\n";
      for (int i = 0; i < openBrakets; i++) {
        var space = (" " * 15) * (openBrakets - i);
        finalJson += space + "}\n";
      }
    } else {
      finalJson += "\n";
    }
    finalJson += "}";
    return finalJson;
  }
}
