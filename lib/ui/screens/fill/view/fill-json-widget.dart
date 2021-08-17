import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/core/utils/constants.dart';
import 'package:gerador_json/ui/screens/fill/json-field-data.dart';
import 'package:gerador_json/ui/screens/fill/view/fill-json-page.dart';
import 'package:gerador_json/ui/screens/home/components/finish-button.dart';
import 'package:gerador_json/ui/screens/home/components/json-field-name.dart';
import 'package:gerador_json/ui/shared-components/shared-app-bar.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class FillJsonWidget extends State<FillJsonPage> {
  final List<JsonFields> jsons;

  FillJsonWidget({required this.jsons});

  bool group = true;

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
        body: Padding(
          padding:
              const EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 15),
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: jsons.length,
              itemBuilder: (context, i) {
                return _form(jsons[i]);
              },
            ),
          ),
        ));
  }

  Widget _form(JsonFields field) {
    return Row(
      children: [
        RichText(
            text: TextSpan(
                text: field.name!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                  text: " (${field.type})",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18))
            ])),
        SizedBox(
          width: 50,
        ),
        _widgetByType(field)
      ],
    );
  }

  List<bool> _selections = List.generate(2, (index) => false);

  Widget _widgetByType(JsonFields field) {
    if (field.type == Constants.TYPE_BOOLEAN) {
      return Expanded(
          child: Row(
        children: [
          Text("True: "),
          Radio(
            value: true,
            groupValue: group,
            onChanged: (value) {
              setState(() {
                group = true;
              });
            },
          ),
          SizedBox(width: 50,),
          Text("False: "),
          Radio(
            value: false,
            groupValue: group,
            onChanged: (value) {
              setState(() {
                group = false;
              });
            },
          ),
        ],
      ));
    } else {
      return Expanded(
          child: JsonFieldData(
        onChanged: (v) {},
        inputFormatters: field.type == Constants.TYPE_NUMBER
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
      ));
    }
  }
}
