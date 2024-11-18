import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Text text;
  final Color? color;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool loading;
  final Function() onPressed; 

  const MyButton({
    super.key,
    this.text = const Text(""),
    this.color,
    this.borderColor = const Color.fromARGB(0, 0, 0, 0),
    this.padding,
    this.icon,
    this.loading = false,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            side: BorderSide(color: borderColor),
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          icon: icon,
          label: text,
          onPressed: loading ? null : onPressed,
        ),
      ),
    );
  }
}