
import 'package:gerador_json/core/model/json-fields.dart';

class HomeService {
  buildForm(List<JsonFields> jsons) {
    JsonFields fatherObject =
        jsons[jsons.indexWhere((element) => element.mainJson == true)];

    ///Sort
    for (int i = 0; i < jsons.length - 1; i++) {
      for (int j = 0; j < jsons.length - i - 1; j++) {
        if (jsons[j].mainJson == null) {
          if (jsons[j].fatherObjectName != jsons[j + 1].fatherObjectName) {
            if (jsons[j].fatherObjectName == fatherObject.name) {
              var temp = jsons[j + 1];
              jsons[j + 1] = jsons[j];
              jsons[j] = temp;
            } else if (jsons[j + 1].fatherObjectName != jsons[j].name) {
              var temp = jsons[j + 1];
              jsons[j + 1] = jsons[j];
              jsons[j] = temp;
            }
          }
        }
      }
    }
    print(jsons);
  }
}
