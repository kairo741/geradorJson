import 'package:flutter/material.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';
import 'package:gerador_json/ui/styles/app_text_styles.dart';

class SharedAppBar extends PreferredSize {
  final List<Widget>? actions;
  final Widget? title;

  SharedAppBar({this.title, this.actions})
      : super(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              actions: actions,
              title: Container(
                height: 90,
                child: title,
              ),
              centerTitle: true,
              // Text(
              //   title,
              //   textAlign: TextAlign.justify,
              //   style: AppTextStyles.titleBold,
              // ),
              backgroundColor: AppColors.kPrimaryColor,
            ));
}
