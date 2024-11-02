// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      emailVerified: json['emailVerified'] as bool,
      phone: json['phone'] as String,
      phoneVerified: json['phoneVerified'] as bool,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'phone': instance.phone,
      'phoneVerified': instance.phoneVerified,
      'password': instance.password,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      avgStar: (json['avgStar'] as num).toInt(),
      content: json['content'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      property: Property.fromJson(json['property'] as Map<String, dynamic>),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
      expiredAt: DateTime.parse(json['expiredAt'] as String),
      verified: json['verified'] as bool,
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$PostStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'avgStar': instance.avgStar,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'property': instance.property,
      'createdBy': instance.createdBy,
      'expiredAt': instance.expiredAt.toIso8601String(),
      'verified': instance.verified,
      'comments': instance.comments,
      'status': _$PostStatusEnumMap[instance.status]!,
    };

const _$PostStatusEnumMap = {
  PostStatus.pending: 'pending',
  PostStatus.contacting: 'contacting',
  PostStatus.selled: 'selled',
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
      propertyType: $enumDecode(_$PropertyTypeEnumMap, json['propertyType']),
      direction: $enumDecode(_$DirectionEnumMap, json['direction']),
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
      'propertyType': _$PropertyTypeEnumMap[instance.propertyType]!,
      'direction': _$DirectionEnumMap[instance.direction]!,
    };

const _$PropertyTypeEnumMap = {
  PropertyType.apartment: 'apartment',
  PropertyType.house: 'house',
  PropertyType.land: 'land',
  PropertyType.office: 'office',
  PropertyType.villa: 'villa',
};

const _$DirectionEnumMap = {
  Direction.north: 'north',
  Direction.south: 'south',
  Direction.east: 'east',
  Direction.west: 'west',
  Direction.southEast: 'southEast',
  Direction.southWest: 'southWest',
  Direction.northEast: 'northEast',
  Direction.northWest: 'northWest',
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
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: User.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
    };
