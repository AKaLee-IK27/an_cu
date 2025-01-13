import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Controllers/wishlist_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Router/app_router.dart';
import 'package:an_cu/Utils/CommonWidget/my_button.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_sizes.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PostCardManage extends ConsumerWidget {
  final Post post;

  const PostCardManage({super.key, required this.post});

  String formatPrice(double price) {
    if (price == 0) {
      return "Liên hệ";
    }

    if (price < 1000) {
      return price.toStringAsFixed(0);
    }

    if (price >= 1e6 && price < 1e9) {
      final millions = price / 1e6;
      return "${NumberFormat('#,##0.##').format(millions)} triệu Đồng";
    }

    if (price >= 1e9) {
      final billions = price / 1e9;
      return "${NumberFormat('#,##0.##').format(billions)} tỷ Đồng";
    }
    final formatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return formatter.format(price);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Property? property = post.property;
    final router = ref.watch(goRouterProvider);

    return InkWell(
      onTap: () {
        router.goPostDetail(post.id);
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            constraints: const BoxConstraints(
              maxHeight: 250,
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
                                text: formatPrice(property?.price ?? 0),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(
                text: const Text(
                  'Chỉnh sửa',
                  style: TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                borderColor: AppColors.secondary,
                width: 150,
                padding: const EdgeInsets.all(10),
                onPressed: () {
                },
              ),
              MyButton(
                text: const Text(
                  'Xóa',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                width: 150,
                color: AppColors.primary,
                padding: const EdgeInsets.all(10),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Xác nhận xóa'),
                        content: const Text('Bạn có chắc chắn muốn xóa bài viết này không?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng hộp thoại
                            },
                            child: const Text(
                              'Hủy',
                              style: TextStyle(color: AppColors.secondary),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              ref.read(postController.notifier).deletePost(post);
                              Navigator.of(context).pop(); // Đóng hộp thoại sau khi xóa
                            },
                            child: const Text(
                              'Xóa',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
