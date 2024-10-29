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
            Text(
              'An Cư Connection',
              style: AppTextStyles.title.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 8.0),
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: AppColors.black20,
              foregroundImage:
                  const AssetImage('assets/images/demo_avatar.png'),
            ),
          ),
        ),
      ],
    );
  }
}
