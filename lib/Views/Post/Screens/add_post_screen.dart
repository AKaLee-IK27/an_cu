import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/CommonWidget/my_button.dart';
import 'package:an_cu/Utils/CommonWidget/my_textfield.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';

class AddPostScreen extends ConsumerWidget {
  AddPostScreen({super.key});

  final titleController = TextEditingController();
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final floorsController = TextEditingController();
  final directionController = TextEditingController();
  final numOfBathroomController = TextEditingController();
  final numOfBedroomController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const MyBackButton(
            color: AppColors.secondary,
          ),
          title: Text('Tạo bài viết', style: AppTextStyles.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chào Khôi,",
                      style: AppTextStyles.title
                          .merge(const TextStyle(color: AppColors.primary)),
                    ),
                    Text(
                      "hãy điền những thông tin về bất động sản của bạn.",
                      style: AppTextStyles.bodyBold,
                    ),
                  ],
                ),
                const SizedBox(height: 25), //Title
                PostTextField(
                  maxLines: 1,
                  controller: titleController,
                  labelText: 'Tên bất động sản',
                  hintText: 'Nhập tên bất động sản',
                ),
                const SizedBox(height: 10), //Province
                PostTextField(
                  maxLines: 1,
                  controller: provinceController,
                  labelText: 'Tỉnh/Thành Phố',
                  hintText: 'Nhập Tỉnh/Thành Phố',
                ),
                const SizedBox(height: 10), //District
                PostTextField(
                  maxLines: 1,
                  controller: districtController,
                  labelText: 'Quận/Huyện',
                  hintText: 'Nhập Quận/Huyện',
                ),
                const SizedBox(height: 10), //Address
                PostTextField(
                  maxLines: 1,
                  controller: addressController,
                  labelText: 'Địa chỉ',
                  hintText: 'Nhập địa chỉ',
                ),
                const SizedBox(height: 10), //Area
                PostTextField(
                  maxLines: 1,
                  controller: areaController,
                  labelText: 'Diện tích',
                  hintText: 'Nhập diện tích',
                ),
                const SizedBox(height: 10), //Num Of Bathroom
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Số tầng',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                        InputQty.int(
                          initVal: 0,
                          steps: 1,
                          minVal: 0,
                          maxVal: 20,
                          decoration: const QtyDecorationProps(
                              isBordered: false,
                              borderShape: BorderShapeBtn.circle,
                              btnColor: AppColors.primary,
                              width: 10),
                          qtyFormProps: QtyFormProps(
                              textAlign: TextAlign.center,
                              controller: floorsController),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else if (value > 20) {
                              return "More than available quantity";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Nhà tắm',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                        InputQty.int(
                          initVal: 0,
                          steps: 1,
                          minVal: 0,
                          maxVal: 20,
                          decoration: const QtyDecorationProps(
                              isBordered: false,
                              borderShape: BorderShapeBtn.circle,
                              btnColor: AppColors.primary,
                              width: 10),
                          qtyFormProps: QtyFormProps(
                              textAlign: TextAlign.center,
                              controller: numOfBathroomController),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else if (value > 20) {
                              return "More than available quantity";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Phòng ngủ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                        InputQty.int(
                          initVal: 0,
                          steps: 1,
                          minVal: 0,
                          maxVal: 20,
                          decoration: const QtyDecorationProps(
                              isBordered: false,
                              borderShape: BorderShapeBtn.circle,
                              btnColor: AppColors.primary,
                              width: 10),
                          qtyFormProps: QtyFormProps(
                              textAlign: TextAlign.center,
                              controller: numOfBedroomController),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else if (value > 20) {
                              return "More than available quantity";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10), //description
                PostTextField(
                  maxLines: null,
                  controller: descriptionController,
                  labelText: 'Thông tin bất động sản',
                  hintText: 'Nhập thông tin bất động sản',
                ),
                const SizedBox(height: 10),
                MyButton(
                    text: const Text(
                      'Tạo bài viết',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    width: 150,
                    color: AppColors.primary,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                      final property = Property(
                        province: provinceController.text,
                        district: districtController.text,
                        price: 500,
                        area: double.parse(areaController.text),
                        bedRoom: int.parse(numOfBedroomController.text),
                        bathRoom: int.parse(numOfBathroomController.text),
                        floor: int.parse(floorsController.text),
                        description: descriptionController.text,
                        images: [],
                        hasFurniture: false,
                      );
                      final post = Post(
                        createdAt: DateTime.now().millisecondsSinceEpoch,
                        property: property,
                        createdBy: ref.read(userProvider).uid,
                        verified: false,
                        comments: [],
                        status: 'pending',
                        title: titleController.text,
                        avgStar: 5,
                      );

                      ref.read(postController.notifier).addPost(post);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostTextField extends MyTextfield {
  const PostTextField({
    super.key,
    super.maxLines,
    required super.controller,
    required super.labelText,
    super.lableStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    super.textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    super.hintText,
    super.obscureText,
    super.prefixIcon,
    super.enabled,
    super.borderColor = AppColors.primary,
  });
}
