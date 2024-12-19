import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    String? email,
    String? name,
    String? phoneNumber,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

@freezed
class Post with _$Post {
  @JsonSerializable(explicitToJson: true)
  const factory Post({
    required String id,
    required String title,
    required int avgStar,
    String? content,
    required int createdAt,
    required Property property,
    required AppUser createdBy,
    required bool verified,
    required List<Comment> comments,
    required String status,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Property with _$Property {
  @JsonSerializable(explicitToJson: true)
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
    required String propertyType,
    required String direction,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}

@freezed
class Province with _$Province {
  @JsonSerializable(explicitToJson: true)
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
  @JsonSerializable(explicitToJson: true)
  const factory Comment({
    required String id,
    required String content,
    required int createdAt,
    required AppUser createdBy,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
