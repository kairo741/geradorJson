import 'package:flutter/material.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class JsonFieldName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey2,
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: AppColors.lightGrey,
          hintText: "Nome do campo do JSON",
          border: OutlineInputBorder(borderSide: BorderSide(width: 200, color: AppColors.black)),
        ),
      ),
    );
  }
}
