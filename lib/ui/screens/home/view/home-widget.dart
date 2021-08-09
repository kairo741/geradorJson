import 'package:flutter/material.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/ui/screens/fill/view/fill-json-page.dart';
import 'package:gerador_json/ui/screens/home/components/finish-button.dart';
import 'package:gerador_json/ui/screens/home/components/json-field-name.dart';
import 'package:gerador_json/ui/screens/home/components/plus-field-button.dart';
import 'package:gerador_json/ui/screens/home/components/type-field-list.dart';
import 'package:gerador_json/ui/screens/home/view/home-page.dart';
import 'package:gerador_json/ui/shared-components/shared-app-bar.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class HomeWidget extends State<HomePage> {
  // List<DropdownMenuItem<String>>? items = <String>[
  //   "String",
  //   "Boolean",
  //   "Integer",
  //   "Object",
  // ].map<DropdownMenuItem<String>>((String value) {
  //   return DropdownMenuItem<String>(
  //     child: Text(value),
  //     value: value,
  //     onTap: onTap,
  //   );
  // }).toList();
  List<JsonFields> jsonFieldsList = [];
  var textFieldNumber = 1;
  var objectName = false;
  var finish = false;

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
          actions: [
            FinishButton(
              onPressed: () async {
                await _formFinished(context);
              },
            )
          ],
        ),
        backgroundColor: AppColors.lightGrey,
        body: ListView(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(20),
              itemCount: textFieldNumber,
              itemBuilder: (context, i) {
                JsonFields jsonField = JsonFields();
                if (finish) {
                  if (jsonField.name != null && jsonField.type != null) {
                    jsonFieldsList.add(jsonField);
                    if (textFieldNumber == i - 1) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return FillJsonPage(
                            jsonFieldsList: jsonFieldsList,
                          );
                        },
                      ));
                    }
                  }
                }
                return Padding(
                    padding: const EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 15),
                    child: Form(
                      child: Row(
                        children: [
                          Expanded(child: JsonFieldName(onChanged: (value) {
                            jsonField.name = value;
                          })),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: TypeFieldList(
                            items: <String>[
                              "String",
                              "Boolean",
                              "Integer",
                              "Object",
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                                onTap: () {
                                  jsonField.type = value;
                                  if (value == "Object") {
                                    print(value);
                                    setState(() {
                                      objectName = true;
                                    });
                                  }
                                },
                              );
                            }).toList(),
                          )),
                          if (objectName) ...[
                            // todo - alterar essa verificação
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(child: JsonFieldName(
                              onChanged: (value) {
                                jsonField.objectName = value;
                                print(jsonField.name);
                                print(jsonField.type);
                                print(jsonField.objectName);
                              },
                            )),
                          ]
                        ],
                      ),
                    ));
              },
            ),
          ],
        ));
  }

  _formFinished(BuildContext context) async {
    _showDialog(context);
    try {
      setState(() {
        finish = true;
      });
      debugPrint(jsonFieldsList.toString());
      _closeDialog(context);
    } catch (e) {
      _closeDialog(context);
      // Fluttertoast.showToast(msg: "Erro ao gerar JSON");
      debugPrint(e.toString());
    }
  }

  _closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  _showDialog(BuildContext context) async {
    var data;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    return data;
  }
}
