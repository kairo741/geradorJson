import 'package:flutter/material.dart';
import 'package:gerador_json/core/model/json-fields.dart';
import 'package:gerador_json/ui/screens/fill/view/fill-json-widget.dart';

class FillJsonPage extends StatefulWidget {
  final List<JsonFields> jsons;

  FillJsonPage({required this.jsons});

  @override
  FillJsonWidget createState() => FillJsonWidget(jsons: jsons);
}
