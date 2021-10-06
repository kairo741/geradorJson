import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class JsonFieldData extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final TextEditingController? controller;

  JsonFieldData(
      {required this.onChanged,
      this.inputFormatters,
      this.readOnly = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width,
      decoration: BoxDecoration(
          color: AppColors.levelButtonFacil,
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: AppColors.levelButtonFacil,
          filled: true,
          hintText: "Dados a serem inseridos no campo",
          border: InputBorder.none,
        ),
        inputFormatters: inputFormatters,
      ),
    );
  }
}
