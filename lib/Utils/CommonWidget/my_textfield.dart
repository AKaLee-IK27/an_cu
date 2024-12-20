import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final int? maxLines;
  final TextEditingController controller;
  final String labelText;
  final TextStyle? lableStyle;
  final TextStyle? textStyle;
  final String? hintText;
  final bool obscureText;
  final Icon? prefixIcon;
  final bool enabled;
  final Color borderColor;

  const MyTextfield({
    super.key,
    this.maxLines,
    required this.controller,
    required this.labelText,
    this.lableStyle,
    this.textStyle,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.enabled = true,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: Colors.black,
      controller: controller,
      obscureText: obscureText,
      style: textStyle,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: lableStyle,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}