
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerador_json/ui/screens/finish/view/finish-page.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class FinishWidget extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Center(
          child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: AppColors.levelButtonFacil,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.kPrimaryColor, width: 2)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText(
              widget.json,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: widget.json.toString()));
                },
                icon: Icon(Icons.copy),
                label: Text("Copiar para área de transferência"))
          ],
        ),
      )),
    );
  }
}
