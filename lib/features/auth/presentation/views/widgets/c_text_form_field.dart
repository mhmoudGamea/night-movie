import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';
import 'package:night_movie/core/utils/styles.dart';

class CTextFormField extends StatelessWidget {
  final String label;
  final TextInputType type;
  final bool visible;
  final TextEditingController controller;
  final String? Function(String?) validate;
  const CTextFormField({
    Key? key,
    required this.label,
    required this.type,
    this.visible = false,
    required this.controller,
    required this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey.withOpacity(0.5),
      style: Styles.font14,
      keyboardType: type,
      obscureText: visible,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: primaryColor.withOpacity(0.1),
        label: Text(label),
        labelStyle: Styles.font14.copyWith(color: Colors.white),
        border: border(0.3),
        enabledBorder: border(0.3),
        focusedBorder: border(0.8),
      ),
      validator: validate,
    );
  }

  UnderlineInputBorder border(double borderColorOpacity) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
          width: 3.3, color: primaryColor.withOpacity(borderColorOpacity)),
    );
  }
}
