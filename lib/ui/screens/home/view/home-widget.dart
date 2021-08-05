import 'package:flutter/material.dart';
import 'package:gerador_json/ui/screens/home/components/finish-button.dart';
import 'package:gerador_json/ui/screens/home/components/json-field-name.dart';
import 'package:gerador_json/ui/screens/home/components/plus-field-button.dart';
import 'package:gerador_json/ui/screens/home/view/home-page.dart';
import 'package:gerador_json/ui/shared-components/shared-app-bar.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class HomeWidget extends State<HomePage> {
  var textFieldNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: PlusFieldButton(
          onPressed: () {
            setState(() {
              textFieldNumber++;
            });
          },
        ),
        appBar: SharedAppBar(
          "Tela inicial alterar",
          actions: [FinishButton(onPressed: (){},)],
        ),
        backgroundColor: AppColors.lightGrey,
        body: ListView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: AppColors.black,
              ),
              padding: const EdgeInsets.all(2.0),
              itemCount: textFieldNumber,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, right: 500, left: 500, bottom: 15),
                  child: JsonFieldName(),
                );
              },
            ),
          ],
        ));
  }
}
