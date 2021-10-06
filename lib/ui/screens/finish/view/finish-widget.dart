import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerador_json/ui/screens/finish/view/finish-page.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class FinishWidget extends State<FinishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: SelectableText(widget.json),
      ),
    );
  }
}
