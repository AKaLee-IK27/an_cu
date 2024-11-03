import 'package:an_cu/Model/model.dart';
import 'package:an_cu/Services/location_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final locationProvider =
    StateNotifierProvider<LocationNotifier, AsyncValue<List<Province>>>(
  (ref) => LocationNotifier(ref),
);

class LocationNotifier extends StateNotifier<AsyncValue<List<Province>>> {
  final Ref _ref;
  late final LocationService _locationService;

  LocationNotifier(this._ref) : super(const AsyncValue.data(<Province>[])) {
    _locationService = _ref.watch(locationService);
    getProvinces();
  }

  Future<void> getProvinces() async {
    state = const AsyncValue.loading();
    try {
      final provinces = await AsyncValue.guard(() async {
        return await _locationService.getProvinces();
      });
      state = AsyncValue.data(provinces.asData!.value);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
