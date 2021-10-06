import 'package:flutter/material.dart';
import 'package:gerador_json/core/controller/home/home-service.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/ui/screens/fill/view/fill-json-page.dart';
import 'package:gerador_json/ui/screens/login/view/login-page.dart';
import 'package:gerador_json/ui/screens/register/view/register-page.dart';

class HomeController {
  HomeService _service = HomeService();

  goToFill(BuildContext context, List<JsonFields> jsons) {
    jsons = _service.buildForm(jsons);
    FillJsonPage screen = FillJsonPage(jsons: jsons);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  goToRegister(BuildContext context) {
    var screen = RegisterPage();
    // screen.user = user;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  goToLogin(BuildContext context) {
    var screen = LoginPage();
    // screen.user = user;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
