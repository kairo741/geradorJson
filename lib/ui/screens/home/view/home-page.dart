import 'package:flutter/material.dart';
import 'package:gerador_json/core/model/user.dart';
import 'package:gerador_json/ui/screens/home/view/home-widget.dart';

class HomePage extends StatefulWidget {
  final User? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  @override
  HomeWidget createState() => HomeWidget();
}
