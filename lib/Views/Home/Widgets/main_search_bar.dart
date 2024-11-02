import 'package:an_cu/Providers/location_provider.dart';
import 'package:an_cu/Providers/searchbar_mode_provider.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:searchfield/searchfield.dart';

class MainSearchBar extends ConsumerWidget {
  const MainSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provinces = ref.watch(locationProvider).value ?? [];
    print(provinces);
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/search_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ToggleButtons(
              textStyle: AppTextStyles.body,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              borderWidth: 2,
              fillColor: AppColors.primary,
              borderColor: AppColors.primary,
              color: AppColors.white,
              selectedBorderColor: AppColors.primary,
              selectedColor: AppColors.white,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 100.0,
              ),
              isSelected: ref.watch(searchBarModeProvider),
              onPressed: (int index) {
                if (index == 0) {
                  ref.read(searchBarModeProvider.notifier).state = [
                    true,
                    false
                  ];
                } else {
                  ref.read(searchBarModeProvider.notifier).state = [
                    false,
                    true
                  ];
                }
              },
              children: const [
                Text('Đang bán'),
                Text('Đã bán'),
              ],
            ),
            SearchField(
              hint: 'Địa điểm tìm kiếm',
              searchInputDecoration: SearchInputDecoration(
                cursorColor: AppColors.primary,
                fillColor: AppColors.white,
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
              itemHeight: 50,
              maxSuggestionsInViewPort: 6,
              suggestionItemDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              onTap: () {},
              suggestions: provinces
                  .map((province) => SearchFieldListItem(province.name))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
