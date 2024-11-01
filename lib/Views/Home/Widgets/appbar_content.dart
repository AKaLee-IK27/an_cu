import 'package:an_cu/Utils/Styles/app_colors.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/logo/main.svg',
              height: 35,
              width: 35,
            ),
            gapW8,
            Text('An Cư Connect', style: AppTextStyles.title),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: AppColors.secondary,
              foregroundImage: AssetImage('assets/images/demo_avatar.png'),
            ),
          ),
        ),
      ],
    );
  }
}
