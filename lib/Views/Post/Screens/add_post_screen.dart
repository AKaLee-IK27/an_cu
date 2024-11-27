import 'package:an_cu/Utils/CommonWidget/app_back_button.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostScreen extends ConsumerWidget {
  const AddPostScreen({super.key});

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
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chào Khôi,",
                      style: AppTextStyles.title,
                    ),
                    Text(
                      "hãy điền những thông tin về bất động sản của bạn.",
                      style: AppTextStyles.bodyBold,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    labelText: 'Tên bất động sản',
                    hintText: 'Nhập tên bất động',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ChipsChoice.multiple(
                  value: const [],
                  onChanged: (value) {},
                  choiceItems: C2Choice.listFrom(
                    source: [],
                    value: (i, v) => v,
                    label: (i, v) => v,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
