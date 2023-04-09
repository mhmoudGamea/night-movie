import 'package:flutter/material.dart';
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
      cursorColor: Colors.white,
      style: Styles.font14,
      keyboardType: type,
      obscureText: visible,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: Styles.font14.copyWith(color: Colors.white),
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(),
      ),
      validator: validate,
    );
  }

  UnderlineInputBorder border() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(width: 2, color: Colors.white),
    );
  }
}
