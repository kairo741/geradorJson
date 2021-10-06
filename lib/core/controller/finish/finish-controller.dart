import 'package:flutter/material.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/ui/screens/finish/view/finish-page.dart';

import 'finish-service.dart';

class FinishController {
  FinishService _service = FinishService();

  goToFinish(BuildContext context, List<JsonFields> jsons) {
    var result = _service.buildJson(jsons);
    FinishPage screen = FinishPage(json: result);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
