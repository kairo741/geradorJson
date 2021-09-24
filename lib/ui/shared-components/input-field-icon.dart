import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gerador_json/ui/styles/app-colors.dart';

class InputFieldIcon extends StatelessWidget {
  final IconData icon;
  final String fieldName;
  final ValueChanged<String> onChanged;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final bool obscureText;

  const InputFieldIcon(this.fieldName,
      {required this.icon,
      required this.onChanged,
      this.obscureText = false,
      this.hintText,
      this.validator,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            fieldName,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Material(
            color: Colors.transparent,
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.kLabelButtonColor,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(icon),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.kUnviewColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        onChanged: onChanged,
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.next,
                        inputFormatters: inputFormatters,
                        validator: validator,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
