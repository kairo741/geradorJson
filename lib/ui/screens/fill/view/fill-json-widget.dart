import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerador_json/core/controller/finish/finish-controller.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/core/utils/constants.dart';
import 'package:gerador_json/ui/screens/fill/json-field-data.dart';
import 'package:gerador_json/ui/screens/fill/view/fill-json-page.dart';
import 'package:gerador_json/ui/screens/home/components/shared-button.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class FillJsonWidget extends State<FillJsonPage> {
  final List<JsonFields> jsons;

  FillJsonWidget({required this.jsons});

  FinishController _finishController = FinishController();

  bool group = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FinishButton(
          icon: Icons.save,
          label: "Finalizar",
          onPressed: () {
            _finishController.goToFinish(context, jsons);
          },
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
        Column(
          children: [
            RichText(
                text: TextSpan(
                    text: field.name!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: " (${field.type})",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18)),
                ])),
            if (field.fatherObjectName != null) ...[
              Center(
                child: Text(" [Filho de: ${field.fatherObjectName}]",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
              ),
            ]
          ],
        ),
        SizedBox(
          width: 50,
        ),
        _widgetByType(field)
      ],
    );
  }

  Widget _widgetByType(JsonFields field) {
    if (field.type == Constants.TYPE_BOOLEAN) {
      return Expanded(
          child: Row(
        children: [
          Text("True: "),
          Radio(
            value: true,
            groupValue: field.content != null ? field.content as bool : false,
            onChanged: (value) {
              setState(() {
                field.content = true;
              });
            },
          ),
          SizedBox(
            width: 50,
          ),
          Text("False: "),
          Radio(
            value: false,
            groupValue: field.content != null ? field.content as bool : false,
            onChanged: (value) {
              setState(() {
                field.content = false;
              });
            },
          ),
        ],
      ));
    } else if (field.type == Constants.TYPE_NULL) {
      return Expanded(
          child: JsonFieldData(
        onChanged: (v) {},
        readOnly: true,
      ));
    } else if (field.type == Constants.TYPE_OBJECT) {
      TextEditingController _objectTypeController = TextEditingController();
      _objectTypeController.text = field.name!;
      return Expanded(
          child: JsonFieldData(
        onChanged: (v) {},
        readOnly: true,
        controller: _objectTypeController,
      ));
    } else {
      return Expanded(
          child: JsonFieldData(
        onChanged: (v) {
          field.content = v;
        },
        inputFormatters: field.type == Constants.TYPE_NUMBER
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
      ));
    }
  }
}
