import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerador_json/core/model/user.dart';
import 'package:gerador_json/core/utils/constants.dart';
import 'package:gerador_json/ui/shared-components/input-field-icon.dart';
import 'package:gerador_json/ui/screens/register/view/register-page.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class RegisterWidget extends State<RegisterPage> {
  var name, username, password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Center(
        child: Material(
          color: Colors.transparent,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kSecondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 640,
            // height: MediaQuery.of(context).size.height * 0.8,
            width: 550,
            // width: MediaQuery.of(context).size.width * 0.4,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Crie uma conta para salvar seus JSONs",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputFieldIcon(
                    "Nome",
                    icon: Icons.drive_file_rename_outline,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value == null || value == "") {
                        return "O Nome é obrigatória!";
                      }
                    },
                    hintText: "Insira sua nome...",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InputFieldIcon("Nome de Usuário",
                      icon: Icons.person,
                      onChanged: (value) {},
                      hintText: "Insira sua Nome de Usuário...",
                      validator: (value) {
                    if (value == null || value == "") {
                      return "O Nome de Usuário é obrigatória!";
                    }
                  }),
                  SizedBox(
                    height: 30,
                  ),
                  InputFieldIcon("Senha",
                      icon: Icons.lock,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      hintText: "Insira sua senha...",
                      validator: (value) {
                        if (value == null || value == "") {
                          return "A senha é obrigatória!";
                        } else if (value.length < 4) {
                          return "A senha deve ser maior que 4 digitos!";
                        }
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  InputFieldIcon("Confirme a senha",
                      icon: Icons.lock,
                      obscureText: true,
                      onChanged: (value) {},
                      hintText: "Confirme sua senha...", validator: (value) {
                    if (value != password) {
                      return "As duas senhas são diferentes!";
                    }
                  }),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: _registerButton(
                        MediaQuery.of(context).size.width * 0.3),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerButton(double width) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.kUnviewColor),
      child: Material(
        // elevation: 5,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          splashColor: AppColors.kThirdColor,
          hoverColor: AppColors.kThirdColor,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Registrar-se!",
              style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          )),
          onTap: () {
            if (_formKey.currentState!.validate()) {
              User user = User(
                  name: name,
                  admin: false,
                  username: username,
                  password: password,
                  userRole: [Constants.ROLE_USER]);

              // todo - fazer função no controller pra mandar pra API
            }
          },
        ),
      ),
    );
  }
}
