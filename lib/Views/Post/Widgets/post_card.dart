import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_sizes.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostCard extends ConsumerWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return InkWell(
      onTap: () {
        router.goPostDetail(id: "1");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        constraints: const BoxConstraints(
          maxHeight: 270,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.grayBG,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/demo_property.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Căn hộ",
                          style: AppTextStyles.body
                              .copyWith(color: AppColors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            gapW20,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sky Dandelions Apartment",
                      style: AppTextStyles.title.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    gapH8,
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                        ),
                        gapW4,
                        Expanded(
                          child: Text(
                            "Quận 2, TP.Hồ Chí Minh",
                            style: AppTextStyles.body,
                          ),
                        ),
                      ],
                    ),
                    gapH8,
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.star,
                        ),
                        gapW4,
                        Text(
                          "4.5",
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "\$ 290",
                          style: AppTextStyles.title.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                        TextSpan(
                          text: "/month",
                          style: AppTextStyles.body
                              .copyWith(color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
