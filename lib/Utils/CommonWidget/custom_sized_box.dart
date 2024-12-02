import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSizedBox extends ConsumerWidget {
  const CustomSizedBox({super.key, this.height, this.percentageScreenHeight});

  final double? height;
  final double? percentageScreenHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(height: height ?? 
      (percentageScreenHeight != null ? 
        MediaQuery.of(context).size.height * (percentageScreenHeight as num) : 
        MediaQuery.of(context).size.height * 0.01));
  }
}