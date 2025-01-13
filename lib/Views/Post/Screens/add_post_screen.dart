import 'dart:collection';
import 'dart:io';

import 'package:an_cu/Controllers/post_controller.dart';
import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/fire_auth_service.dart';
import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/CommonWidget/my_button.dart';
import 'package:an_cu/Utils/CommonWidget/my_textfield.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:an_cu/Views/Post/Controller/image_add_post_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:input_quantity/input_quantity.dart';

enum Direction {
  east('Đông', 'Đông'),
  west('Tây', 'Tây'),
  south('Nam', 'Nam'),
  north('Bắc', 'Bắc'),
  northeast('Đông Bắc', 'Đông Bắc'),
  southeast('Đông Nam', 'Đông Nam'),
  northwest('Tây Bắc', 'Tây Bắc'),
  southwest('Tây Nam', 'Tây Nam');

  const Direction(this.label, this.value);
  final String label;
  final String value;

  static final List<DropdownMenuEntry<Direction>> entries =
      UnmodifiableListView<DropdownMenuEntry<Direction>>(
    values.map<DropdownMenuEntry<Direction>>(
      (Direction direction) => DropdownMenuEntry<Direction>(
        value: direction,
        label: direction.label,
      ),
    ),
  );
}

Future<String?> uploadImageToCloudinary(String imagePath) async {
  final dio = Dio();
  const String cloudName = 'db7lwrzjz';
  const String uploadPreset = 'o8fpswtc';
  const String url = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

  try {
    // Đọc ảnh từ file
    final bytes = await XFile(imagePath).readAsBytes();

    // Tạo FormData
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        bytes,
        filename: imagePath.split('/').last,
      ),
      'upload_preset': uploadPreset,
    });

    // Gửi request
    final response = await dio.post(url, data: formData);

    if (response.statusCode == 200) {
      return response.data['secure_url'];
    } else {
      print('Error uploading image: ${response.statusMessage}');
      return null;
    }
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}

class AddPostScreen extends ConsumerWidget {
  AddPostScreen({super.key});

  final titleController = TextEditingController();
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final floorsController = TextEditingController();
  final priceController = TextEditingController();
  final directionController = TextEditingController();
  final isFurnitureController = TextEditingController();
  final numOfBathroomController = TextEditingController();
  final numOfBedroomController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final selectedImages = ref.watch(selectedImagesProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const MyBackButton(
            color: AppColors.secondary,
          ),
          title: Text('Tạo bài viết', style: AppTextStyles.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chào ${user.displayName ?? ""},",
                      style: AppTextStyles.title
                          .merge(const TextStyle(color: AppColors.primary)),
                    ),
                    Text(
                      "hãy điền những thông tin về bất động sản của bạn.",
                      style: AppTextStyles.bodyBold,
                    ),
                  ],
                ),
                const SizedBox(height: 10), //Title
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
                const SizedBox(height: 10),
                PostTextField(
                  maxLines: 1,
                  controller: priceController,
                  labelText: 'Mức giá',
                  hintText: 'Nhập mức giá',
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
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownMenu<Direction>(
                      width: 150,
                      initialSelection: Direction.east,
                      controller: directionController,
                      requestFocusOnTap: true,
                      label: const Text('Hướng nhà'),
                      dropdownMenuEntries: Direction.entries,
                    ),
                    DropdownMenu<bool>(
                      width: 150,
                      initialSelection: false,
                      controller: isFurnitureController,
                      requestFocusOnTap: true,
                      label: const Text('Nội thất'),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry<bool>(
                          value: true,
                          label: 'Đã có',
                        ),
                        DropdownMenuEntry<bool>(
                          value: false,
                          label: 'Chưa có',
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
                ElevatedButton.icon(
                  onPressed: () async {
                    // Chọn hình ảnh
                    final ImagePicker picker = ImagePicker();
                    final List<XFile> pickedImages =
                        await picker.pickMultiImage();

                    final imagePaths =
                        pickedImages.map((file) => file.path).toList();
                    ref
                        .read(selectedImagesProvider.notifier)
                        .addImages(imagePaths);
                  },
                  icon: const Icon(
                    Icons.photo_library,
                    color: AppColors.primary,
                  ),
                  label: const Text(
                    'Chọn hình ảnh',
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                selectedImages.isNotEmpty
                    ? SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedImages.length,
                          itemBuilder: (context, index) {
                            final imagePath = selectedImages[index];
                            return Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: !kIsWeb
                                      ? Image.file(
                                          File(imagePath),
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        )
                                      : Image.network(imagePath),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: IconButton(
                                    icon: const Icon(Icons.close,
                                        color: Colors.red),
                                    onPressed: () {
                                      ref
                                          .read(selectedImagesProvider.notifier)
                                          .removeImage(imagePath);
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    : Container(),
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
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) =>
                            const Center(child: CircularProgressIndicator()),
                      );

                      final List<String> uploadedUrls = [];
                      for (String imagePath in selectedImages) {
                        final String? imageUrl =
                            await uploadImageToCloudinary(imagePath);
                        if (imageUrl != null) {
                          uploadedUrls.add(imageUrl);
                        }
                      }

                      Navigator.of(context).pop();

                      if (uploadedUrls.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Không thể upload ảnh. Vui lòng thử lại.')),
                        );
                        return;
                      }

                      final property = Property(
                        province: provinceController.text,
                        district: districtController.text,
                        address: addressController.text,
                        price: double.parse(priceController.text),
                        area: double.parse(areaController.text),
                        bedRoom: int.parse(numOfBedroomController.text),
                        bathRoom: int.parse(numOfBathroomController.text),
                        floor: int.parse(floorsController.text),
                        description:
                            descriptionController.text.replaceAll('\n', '\\n'),
                        direction: directionController.text,
                        images: uploadedUrls,
                        hasFurniture:
                            isFurnitureController.text == "true" ? true : false,
                        propertyType: "Căn hộ",
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

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Tạo bài viết thành công!')),
                      );

                      titleController.clear();
                      provinceController.clear();
                      districtController.clear();
                      addressController.clear();
                      areaController.clear();
                      floorsController.clear();
                      priceController.clear();
                      directionController.clear();
                      isFurnitureController.clear();
                      numOfBathroomController.clear();
                      numOfBedroomController.clear();
                      descriptionController.clear();
                      ref.read(selectedImagesProvider.notifier).clearImages();
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
