import 'package:flutter/material.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class JsonFieldName extends StatelessWidget {
  final ValueChanged<String> onChanged;

  JsonFieldName({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width,
      decoration: BoxDecoration(color: AppColors.levelButtonFacil, borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        textAlign: TextAlign.center,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: AppColors.levelButtonFacil,
          filled: true,
          hintText: "Nome do campo do JSON",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
