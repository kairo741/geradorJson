import 'package:flutter/material.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class TypeFieldList extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? value;

  const TypeFieldList({
    required this.items,
    Key? key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width,
        decoration: BoxDecoration(color: AppColors.levelButtonFacil, borderRadius: BorderRadius.circular(8)),
        child: DropdownButtonFormField(
          isExpanded: true,
          value: value,
          selectedItemBuilder: (BuildContext context) {
            return items!.map<Widget>((DropdownMenuItem item) {
              return Text(
                item.value,
                overflow: TextOverflow.ellipsis,
              );
            }).toList();
          },
          // iconSize: 200,
          dropdownColor: AppColors.levelButtonFacil,
          decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: AppColors.levelButtonFacil,
              filled: true,
              hintText: "Escolha o tipo do campo"),
          onChanged: (value) {
            FocusScope.of(context).requestFocus(new FocusNode()); /// Isso vai limpar o foco do TextField
          },
          items: items,
        ));
  }
}
