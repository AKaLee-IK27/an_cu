import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_sizes.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:an_cu/Views/Home/Widgets/search_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MainSearchBar extends StatefulWidget {
  const MainSearchBar({super.key});

  @override
  _MainSearchBarState createState() => _MainSearchBarState();
}

class _MainSearchBarState extends State<MainSearchBar> {
  final List<bool> _selectedMode = [true, false];

  @override
  Widget build(BuildContext context) {
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
              isSelected: _selectedMode,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedMode.length; i++) {
                    _selectedMode[i] = i == index;
                  }
                });
              },
              children: const [
                Text('Đang bán'),
                Text('Đã bán'),
              ],
            ),
            MaterialButton(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              color: AppColors.white,
              minWidth: double.infinity,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on, color: AppColors.primary),
                  gapW4,
                  Text(
                    'Khu vực tìm kiếm',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  showDragHandle: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const SearchBottomSheet();
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
