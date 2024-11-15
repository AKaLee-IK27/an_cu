import 'package:an_cu/Utils/Helpers/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

enum Direction {
  north,
  south,
  east,
  west,
  southEast,
  southWest,
  northEast,
  northWest,
}

enum PostStatus {
  pending,
  contacting,
  selled,
}

enum PropertyType {
  apartment,
  house,
  land,
  office,
  villa,
}

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    String? guid,
    required String email,
    required String phone,
    required bool phoneVerified,
    required String password,
    required String name,
    required String avatar,
    required DateTime dateOfBirth,
  }) = _AppUser;
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String title,
    required int avgStar,
    String? content,
    
    @TimestampConverter() required DateTime createdAt,
    required Property property,
    @TimestampConverter() required DateTime expiredAt,
    required bool verified,
    @Default([]) required List<Comment> comments,
    required PostStatus status,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Property with _$Property {
  const factory Property({
    required String address,
    Province? province,
    District? district,
    required double price,
    required double area,
    required int bedRoom,
    required int bathRoom,
    required int floor,
    required String description,
    required List<String> images,
    required bool hasFurniture,
    required PropertyType propertyType,
    required Direction direction,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}

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

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String content,
    @TimestampConverter() required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
