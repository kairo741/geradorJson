import 'package:flutter/material.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/ui/screens/home/components/finish-button.dart';
import 'package:gerador_json/ui/screens/home/view/home-page.dart';
import 'package:gerador_json/ui/shared-components/shared-app-bar.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class FillJsonWidget extends State<HomePage> {
  final List<JsonFields> jsonFieldsList;

  FillJsonWidget({required this.jsonFieldsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SharedAppBar(
          "Preencher JSON",
          actions: [
            FinishButton(
              onPressed: () async {},
            )
          ],
        ),
        backgroundColor: AppColors.lightGrey,
        body: Container(
          child: Text(jsonFieldsList[0].name!),
        ));
  }
}
