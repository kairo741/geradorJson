import 'package:flutter/material.dart';
import 'package:gerador_json/ui/styles/custom-text-theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gerador de Json",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gotham-SSm', primarySwatch: Colors.red, textTheme: customTextTheme),
      home: LoginPage(),
    );
  }
}
