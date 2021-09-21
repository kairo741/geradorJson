import 'package:flutter/material.dart';
import 'package:gerador_json/core/controller/home/home-service.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/ui/screens/fill/view/fill-json-page.dart';

class HomeController {
  HomeService _service = HomeService();

  goToFill(BuildContext context, List<JsonFields> jsons) {
    _service.buildForm(jsons);
    FillJsonPage screen = FillJsonPage(jsons: jsons);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }


}
