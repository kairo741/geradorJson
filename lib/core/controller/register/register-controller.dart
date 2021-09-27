import 'package:gerador_json/core/controller/register/register-service.dart';
import 'package:gerador_json/core/model/Info.dart';
import 'package:gerador_json/core/model/user.dart';

class RegisterController {
  RegisterService _service = RegisterService();

  Future<Info> registerUser(User user) async {
    Info info = await _service.sendUserToAPI(user);

    return info;
  }
}
