import 'package:flutter/material.dart';
import 'package:gerador_json/core/controller/register/register-service.dart';
import 'package:gerador_json/core/model/Info.dart';
import 'package:gerador_json/core/model/user.dart';
import 'package:gerador_json/ui/screens/home/view/home-page.dart';

class RegisterController {
  RegisterService _service = RegisterService();

  Future<Info> registerUser(User user) async {
    Info info = await _service.sendUserToAPI(user);

    return info;
  }

  goToHome(BuildContext context, User user) {
    var screen = HomePage();
    screen.user = user;
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
