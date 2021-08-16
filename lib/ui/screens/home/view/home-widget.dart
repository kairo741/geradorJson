import 'package:flutter/material.dart';
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
  var _countFields;
  List<Map<String, dynamic>> _values = [];
  List<JsonFields> jsonFieldsList = [];
  var _childObjectStatus = false;
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

                JsonFields jsonField = JsonFields();
                // if (finish) { // todo verificar
                //   if (jsonField.name != null && jsonField.type != null) {
                //     jsonFieldsList.add(jsonField);
                //     if (_countFields == i - 1) {
                //       Navigator.push(context, MaterialPageRoute(
                //         builder: (context) {
                //           return FillJsonPage(
                //             jsonFieldsList: jsonFieldsList,
                //           );
                //         },
                //       ));
                //     }
                //   }
                // }
                return _fieldsRow(i);
              },
            ),
          ],
        ));
  }

  Widget _fieldsRow(int index) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 15, right: 50, left: 50, bottom: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: JsonFieldName(onChanged: (value) {
                  _onUpdate(index, value, JsonFields.NAME);
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
                        _onUpdate(index, value, JsonFields.TYPE);
                        _setChildObjectStatys(index, value);
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
                      _onUpdate(index, value, JsonFields.OBJECT_NAME);
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

  _setChildObjectStatys(int index, String type) {
    if (type == "Object") {
      _onUpdate(index, Constants.ACTIVE, JsonFields.CHILD_OBJECT_STATUS);
      setState(() {});
    } else {
      _onUpdate(index, Constants.INACTIVE, JsonFields.CHILD_OBJECT_STATUS);
      setState(() {});
      // todo - fazer parte do nome do filho
    }
  }

  bool _searchStatusChildObject(int index) {
    ///repetição da lógica de busca
    for (var map in _values) {
      if (map.containsKey('id')) {
        if (map.containsKey(JsonFields.CHILD_OBJECT_STATUS)) {
          if (map['id'] == index) {
            if (map[JsonFields.CHILD_OBJECT_STATUS] == Constants.ACTIVE) {
              return true;
            } else {
              return false;
            }
          }
        }
      }
    }
    return false;
  }

  int _searchInMap(int index) {
    int foundIndex = -1;

    ///busca para ver se o registro já foi inserido
    ///para não haver duplicação de chaves
    for (var map in _values) {
      if (map.containsKey('id')) {
        if (map['id'] == index) {
          // todo - verificar se está funcionando
          foundIndex = index;
          break;
        }
      }
    }
    return foundIndex;
  }

  ///Json Logic
  _onUpdate(int index, String value, String fieldName) {
    int foundIndex = _searchInMap(index);

    if (-1 != foundIndex) {
      _values.removeWhere((element) {
        return element['id'] == foundIndex;
      });
    }
    Map<String, dynamic> json = {'id': index, fieldName: value};

    _values.add(json);

    print(_values);
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
