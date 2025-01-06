import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(explicitToJson: true)
  const factory Post({
    String? id,
    required String title,
    int? avgStar,
    String? content,
    required int createdAt,
    Property? property,
    String? createdBy,
    bool? verified,
    List<Comment>? comments,
    String? status,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@freezed
class Property with _$Property {
  @JsonSerializable(explicitToJson: true)
  const factory Property({
    String? province,
    String? district,
    String? address,
    double? price,
    double? area,
    int? bedRoom,
    int? bathRoom,
    int? floor,
    String? description,
    List<String>? images,
    bool? hasFurniture,
    String? propertyType,
    String? direction,
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
    required String createdBy,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

@freezed
class Wishlist with _$Wishlist {
  @JsonSerializable(explicitToJson: true)
  const factory Wishlist({
    required String idUser,
    required List<String> idPosts,
  }) = _Wishlist;

  factory Wishlist.fromJson(Map<String, dynamic> json) =>
      _$WishlistFromJson(json);
}