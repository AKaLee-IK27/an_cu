import 'package:an_cu/Models/location/location.dart';
import 'package:an_cu/Services/location_service.dart';
import 'package:an_cu/Utils/Styles/app_colors.dart';
import 'package:an_cu/Utils/Styles/app_sizes.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class MainSearchBar extends StatefulWidget {
  const MainSearchBar({super.key});

  @override
  _MainSearchBarState createState() => _MainSearchBarState();
}

class _MainSearchBarState extends State<MainSearchBar> {
  final List<bool> _selectedMode = [true, false];
  final TextEditingController _searchController = TextEditingController();

  late Future<List<Province>> _provincesFuture;

  @override
  void initState() {
    super.initState();
    _provincesFuture = LocationService.getProvinces();
  }

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
                    return Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.6,
                      ),
                      child: FutureBuilder<List<Province>>(
                        future: _provincesFuture,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Province>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text('No data available'));
                          } else {
                            final provinces = snapshot.data!;
                            return Column(
                              children: [
                                Text(
                                  'Tỉnh/Thành phố',
                                  style: AppTextStyles.title,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: provinces.map((province) {
                                          return ListTile(
                                            title: Text(
                                              province.name,
                                              style: AppTextStyles.body,
                                            ),
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    );
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
