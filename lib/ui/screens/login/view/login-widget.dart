import 'package:flutter/material.dart';
import 'package:gerador_json/ui/shared-components/input-field-icon.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

import 'login-page.dart';

class LoginWidget extends State<LoginPage> {
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
            height: 350,
            width: 600,
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                InputFieldIcon(
                  "Nome de Usuário",
                  icon: Icons.person,
                  onChanged: (value) {},
                  hintText: "Insira sua Nome de Usuário...",
                ),
                SizedBox(
                  height: 30,
                ),
                InputFieldIcon(
                  "Senha",
                  icon: Icons.lock,
                  onChanged: (value) {},
                  hintText: "Insira sua senha...",
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child:
                      _registerButton(MediaQuery.of(context).size.width * 0.3),
                )
              ],
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
              "Entrar!",
              style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
          )),
          onTap: () {},
        ),
      ),
    );
  }
}
