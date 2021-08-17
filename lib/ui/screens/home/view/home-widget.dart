import 'package:flutter/material.dart';
import 'package:gerador_json/core/controller/home/home-controller.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/core/utils/constants.dart';
import 'package:gerador_json/ui/screens/home/components/finish-button.dart';
import 'package:gerador_json/ui/screens/home/components/json-field-name.dart';
import 'package:gerador_json/ui/screens/home/components/plus-field-button.dart';
import 'package:gerador_json/ui/screens/home/components/type-field-list.dart';
import 'package:gerador_json/ui/screens/home/view/home-page.dart';
import 'package:gerador_json/ui/shared-components/shared-app-bar.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class HomeWidget extends State<HomePage> {
  final HomeController _controller = HomeController();
  var _json;

  var _countFields;
  List<JsonFields> _jsonFieldsList = [];
  var finish = false;

  @override
  void initState() {
    super.initState();
    _countFields = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: PlusFieldButton(
          onPressed: () {
            setState(() {
              _countFields++;
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
            ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: _countFields,
              itemBuilder: (context, i) {
                ///Começa a contruição da pagina
                return _fieldsRow(i);
              },
            ),
          ],
        ));
  }

  Widget _fieldsRow(int index) {
    var fields = JsonFields(id: index);

    return Padding(
        padding:
            const EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: JsonFieldName(onChanged: (value) {
                  fields.name = value;
                  _onUpdate(index, fields, JsonFields.NAME);
                })),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: TypeFieldList(
                  items: <String>[
                    "String",
                    "Boolean",
                    "Number",
                    "Array",
                    "Null",
                    "Object",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                      onTap: () async {
                        fields.type = value;
                        if (value == "Object") {
                          setState(() {
                            fields.childObjectStatus = Constants.ACTIVE;
                            // print("é object " + fields.childObjectStatus!);
                          });
                        } else {
                          setState(() {
                            fields.childObjectStatus = Constants.INACTIVE;
                            // print("não é object " + fields.childObjectStatus!);
                          });
                          // todo - fazer parte do nome do filho
                        }
                        _jsonFieldsList.forEach((element) {
                          if (element.id == fields.id) {
                            return;
                          }
                        });
                        await _onUpdate(index, fields, JsonFields.TYPE);
                      },
                    );
                  }).toList(),
                )),
                if (_searchStatusChildObject(index)) ...[
                  // todo - alterar essa verificação
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(child: JsonFieldName(
                    onChanged: (value) {
                      fields.childObjectName = value;
                      _onUpdate(index, fields, JsonFields.OBJECT_NAME);
                    },
                  )),
                ],
              ],
            ),
            Divider(
              // height: 10,
              color: AppColors.grey2,
            )
          ],
        ));
  }

  _formFinished(BuildContext context) async {
    // _showDialog(context);
    if (_jsonFieldsList.isNotEmpty) {
      try {
        setState(() {
          finish = true;
        });
        // debugPrint(jsonFieldsList.toString());
        _controller.goToFill(context, _jsonFieldsList);
        // _closeDialog(context);
      } catch (e) {
        // _closeDialog(context);
        // Fluttertoast.showToast(msg: "Erro ao gerar JSON");
        debugPrint(e.toString());
      }
    } else {
      // todo - fazer uma alertbox ou algo do tipo
    }
  }

  _alredyExists(int index) {
    var exists = false;
    _jsonFieldsList.forEach((element) {
      if (element.id == index) {
        exists = true;
        return;
      }
    });
    return exists;
  }

  bool _searchStatusChildObject(int index) {
    var result = false;
    _jsonFieldsList.forEach((element) {
      if (element.id == index &&
          element.childObjectStatus == Constants.ACTIVE) {
        result = true;
        return;
      }
    });
    // print((index.toString() + result.toString()));
    return result;
  }

  ///Json Logic
  _onUpdate(int index, JsonFields fields, String alteredField) {
    var stop = false;

    _jsonFieldsList.forEach((element) {
      if (element.id == fields.id) {
        if (alteredField == JsonFields.NAME) {
          element.name = fields.name;
        } else if (alteredField == JsonFields.TYPE) {
          element.type = fields.type;
          element.childObjectStatus = fields.childObjectStatus;
        } else if (alteredField == JsonFields.OBJECT_NAME) {
          element.childObjectName = fields.childObjectName;
        }

        _jsonFieldsList.removeAt(fields.id!);
        _jsonFieldsList.insert(fields.id!, element);
        stop = true;
        return;
      }
    });

    if (stop) {
      return;
    } else {
      _jsonFieldsList.add(fields);
    }
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
