import 'package:gerador_json/core/model/json-fields.dart';

class HomeService {
  buildForm(List<JsonFields> jsons) {
    JsonFields fatherObject =
        jsons[jsons.indexWhere((element) => element.mainJson == true)];
    int fatherObjectIndex =
        jsons.indexWhere((element) => element.mainJson == true);
    List<JsonFields> sortedJsons = [];

    ///Sort
    for (int i = 0; i < jsons.length - 1; i++) {
      for (int j = 0; j < jsons.length - i; j++) {
        if (jsons[j].mainJson == null || !jsons[j].mainJson!) {
          if (jsons[j].fatherObjectName == fatherObject.name) {
            if (sortedJsons.length > 0) {
              if (!sortedJsons.contains(jsons[j])) {
                sortedJsons.insert(fatherObjectIndex + 1, jsons[j]);
              }
            } else {
              sortedJsons.insert(0, jsons[j]);
            }
          } else {
            if (!sortedJsons.contains(jsons[j])) {
              var fatherIndex = sortedJsons.indexWhere(
                      (element) => (element.name == jsons[j].fatherObjectName));
              sortedJsons.insert(fatherIndex + 1, jsons[j]);
            }

          }
        }
      }
    }
    // index - 1 da lista inicial, pois, não contém o objeto pai
    print(sortedJsons);
  }
}
