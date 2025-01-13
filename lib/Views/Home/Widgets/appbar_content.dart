import 'package:an_cu/Utils/Styles/app_sizes.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/logo/main.svg',
            height: 42,
            width: 42,
          ),
          gapW8,
          Text('An Cư Connect', style: AppTextStyles.title),
        ],
      ),
    );
  }
}
