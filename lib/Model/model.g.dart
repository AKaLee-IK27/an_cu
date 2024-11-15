// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      guid: json['guid'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      phoneVerified: json['phoneVerified'] as bool,
      password: json['password'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'guid': instance.guid,
      'email': instance.email,
      'phone': instance.phone,
      'phoneVerified': instance.phoneVerified,
      'password': instance.password,
      'name': instance.name,
      'avatar': instance.avatar,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
    };

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      avgStar: (json['avgStar'] as num).toInt(),
      content: json['content'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      property: Property.fromJson(json['property'] as Map<String, dynamic>),
      expiredAt:
          const TimestampConverter().fromJson(json['expiredAt'] as Timestamp),
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
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'property': instance.property,
      'expiredAt': const TimestampConverter().toJson(instance.expiredAt),
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
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
