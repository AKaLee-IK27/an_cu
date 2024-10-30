import 'package:an_cu/Models/location/location.dart';
import 'package:an_cu/Services/location_service.dart';
import 'package:an_cu/Utils/Styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      child: const ProvinceSearch(),
    );
  }
}

class ProvinceSearch extends StatefulWidget {
  const ProvinceSearch({
    super.key,
  });

  @override
  State<ProvinceSearch> createState() => _ProvinceSearchState();
}

class _ProvinceSearchState extends State<ProvinceSearch> {
  late Future<List<Province>> _provincesFuture;

  @override
  void initState() {
    super.initState();
    _provincesFuture = LocationService.getProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Province>>(
      future: _provincesFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Province>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
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
    );
  }
}
