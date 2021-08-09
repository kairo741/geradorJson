import 'package:flutter/material.dart';

class PlusFieldButton extends StatelessWidget {
  final VoidCallback? onPressed;

  PlusFieldButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF424141),
            Color(0x4A424141),
            Color(0x4A717171),
          ],
        ),
      ),
      child: TextButton.icon(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16.0),
            primary: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: onPressed,
          icon: Icon(Icons.add),
          label: Text("Adicionar mais um campo")),
    );
  }
}
