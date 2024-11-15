import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String labelText;
  final TextStyle? textStyle;
  final bool obscureText;
  final Icon? prefixIcon;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.textStyle,
    this.obscureText = false,
    this.prefixIcon = null,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: textStyle,
                  prefixIcon: prefixIcon,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            );
  }
}