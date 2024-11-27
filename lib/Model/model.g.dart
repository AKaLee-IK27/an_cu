// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      avgStar: (json['avgStar'] as num).toInt(),
      content: json['content'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
      property: Property.fromJson(json['property'] as Map<String, dynamic>),
      createdBy: AppUser.fromJson(json['createdBy'] as Map<String, dynamic>),
      verified: json['verified'] as bool,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'avgStar': instance.avgStar,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'property': instance.property,
      'createdBy': instance.createdBy,
      'verified': instance.verified,
      'comments': instance.comments,
      'status': instance.status,
    };

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      address: json['address'] as String,
      province: json['province'] == null
          ? null
          : Province.fromJson(json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      bedRoom: (json['bedRoom'] as num).toInt(),
      bathRoom: (json['bathRoom'] as num).toInt(),
      floor: (json['floor'] as num).toInt(),
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      hasFurniture: json['hasFurniture'] as bool,
      propertyType: json['propertyType'] as String,
      direction: json['direction'] as String,
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'province': instance.province,
      'district': instance.district,
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

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      createdBy: AppUser.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
    };
