import 'package:gerador_json/core/model/Info.dart';
import 'package:gerador_json/core/model/user.dart';
import 'package:gerador_json/core/utils/constants.dart';
import 'package:gerador_json/core/utils/dio/dio-config.dart';

class RegisterService {
  Future<Info> sendUserToAPI(User user) async {
    String path = Constants.CREATE_USER_PATH;
    var dio = await DioConfig.builderConfig();
    var response = await dio.post(path, data: user.toJson());
    Info result = Info.fromJson(response.data);
    return result;
  }
}
