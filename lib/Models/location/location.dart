import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Province with _$Province {
  const factory Province({
    required String name,
    required List<District> districts,
  }) = _Province;

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
}

@freezed
class District with _$District {
  const factory District({
    required String name,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}
