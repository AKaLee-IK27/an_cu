// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProvinceImpl _$$ProvinceImplFromJson(Map<String, dynamic> json) =>
    _$ProvinceImpl(
      name: json['name'] as String,
      districts: (json['districts'] as List<dynamic>)
          .map((e) => District.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProvinceImplToJson(_$ProvinceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'districts': instance.districts,
    };

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
