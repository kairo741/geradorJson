import 'package:flutter/material.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';
import 'package:gerador_json/ui/styles/app_text_styles.dart';

class SharedAppBar extends PreferredSize {

  final String title;
  final List<Widget>? actions;

  SharedAppBar(this.title, {this.actions})
      : super(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              actions: actions,
              title: Text(
                title,
                textAlign: TextAlign.justify,
                style: AppTextStyles.titleBold,
              ),
              backgroundColor: AppColors.kPrimaryColor,
            ));
}
