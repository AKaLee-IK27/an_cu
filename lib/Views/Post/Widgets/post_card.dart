import 'package:an_cu/Controllers/wishlist_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_sizes.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PostCard extends ConsumerWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Property? property = post.property;
    final router = ref.watch(goRouterProvider);

    return InkWell(
      onTap: () {
        router.goPostDetail(post.id);
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      child:  post.property!.images!.isNotEmpty ? CachedNetworkImage(
                        imageUrl: post.property?.images?.first ?? "" ,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Image.asset('assets/images/demo_property.jpg', fit: BoxFit.cover,),
                        ),
                      ) : Image.asset('assets/images/demo_property.jpg', fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              onPressed: () {
                                ref
                                    .read(wishlistController.notifier)
                                    .addPostToWishList(post);
                              },
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
                              property?.propertyType ?? "",
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gapW20,
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.title,
                    style: AppTextStyles.title
                        .copyWith(color: AppColors.secondary, fontSize: 18, ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                          ),
                          gapW4,
                          Expanded(
                            child: Text(
                              "${property?.district}, ${property?.province}",
                              style: AppTextStyles.body,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.star,
                          ),
                          gapW4,
                          Text(
                            post.avgStar.toString(),
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$ ${property?.price}",
                            style: AppTextStyles.title.copyWith(
                              color: AppColors.secondary,
                            ),
                          ),
                          // TextSpan(
                          //   text: "/month",
                          //   style: AppTextStyles.body
                          //       .copyWith(color: AppColors.secondary),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
