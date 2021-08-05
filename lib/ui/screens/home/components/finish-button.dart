import 'package:flutter/material.dart';

class FinishButton extends StatelessWidget {
  final VoidCallback? onPressed;

  FinishButton({this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton.icon(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: onPressed,
          icon: Icon(Icons.save),
          label: Text("Finalizar")),
    );
  }
}
