import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Text text;
  final double? width;
  final double? height;
  final Color? color;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool loading;
  final AlignmentGeometry? alignmentItem;
  final Function() onPressed; 

  const MyButton({
    super.key,
    this.text = const Text(""),
    this.width = double.infinity,
    this.height,
    this.color,
    this.borderColor = const Color.fromARGB(0, 0, 0, 0),
    this.padding,
    this.icon,
    this.loading = false,
    this.alignmentItem,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          alignment: alignmentItem,
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
    );
  }
}