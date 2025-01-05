// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String?,
      title: json['title'] as String,
      avgStar: (json['avgStar'] as num?)?.toInt(),
      content: json['content'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
      createdBy: json['createdBy'] as String?,
      verified: json['verified'] as bool?,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'avgStar': instance.avgStar,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'property': instance.property?.toJson(),
      'createdBy': instance.createdBy,
      'verified': instance.verified,
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      province: json['province'] as String?,
      district: json['district'] as String?,
      address: json['address'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      area: (json['area'] as num?)?.toDouble(),
      bedRoom: (json['bedRoom'] as num?)?.toInt(),
      bathRoom: (json['bathRoom'] as num?)?.toInt(),
      floor: (json['floor'] as num?)?.toInt(),
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hasFurniture: json['hasFurniture'] as bool?,
      propertyType: json['propertyType'] as String?,
      direction: json['direction'] as String?,
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'province': instance.province,
      'district': instance.district,
      'address': instance.address,
      'price': instance.price,
      'area': instance.area,
      'bedRoom': instance.bedRoom,
      'bathRoom': instance.bathRoom,
      'floor': instance.floor,
      'description': instance.description,
      'images': instance.images,
      'hasFurniture': instance.hasFurniture,
      'propertyType': instance.propertyType,
      'direction': instance.direction,
    };

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
      'districts': instance.districts.map((e) => e.toJson()).toList(),
    };

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
    };
