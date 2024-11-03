// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get phoneVerified => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String email,
      bool emailVerified,
      String phone,
      bool phoneVerified,
      String password,
      String fullName,
      String avatar});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? phone = null,
    Object? phoneVerified = null,
    Object? password = null,
    Object? fullName = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      bool emailVerified,
      String phone,
      bool phoneVerified,
      String password,
      String fullName,
      String avatar});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? emailVerified = null,
    Object? phone = null,
    Object? phoneVerified = null,
    Object? password = null,
    Object? fullName = null,
    Object? avatar = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.email,
      required this.emailVerified,
      required this.phone,
      required this.phoneVerified,
      required this.password,
      required this.fullName,
      required this.avatar});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final bool emailVerified;
  @override
  final String phone;
  @override
  final bool phoneVerified;
  @override
  final String password;
  @override
  final String fullName;
  @override
  final String avatar;

  @override
  String toString() {
    return 'User(id: $id, email: $email, emailVerified: $emailVerified, phone: $phone, phoneVerified: $phoneVerified, password: $password, fullName: $fullName, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, emailVerified, phone,
      phoneVerified, password, fullName, avatar);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String email,
      required final bool emailVerified,
      required final String phone,
      required final bool phoneVerified,
      required final String password,
      required final String fullName,
      required final String avatar}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  bool get emailVerified;
  @override
  String get phone;
  @override
  bool get phoneVerified;
  @override
  String get password;
  @override
  String get fullName;
  @override
  String get avatar;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get avgStar => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Property get property => throw _privateConstructorUsedError;
  User get createdBy => throw _privateConstructorUsedError;
  DateTime get expiredAt => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;
  PostStatus get status => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String title,
      int avgStar,
      String? content,
      DateTime createdAt,
      Property property,
      User createdBy,
      DateTime expiredAt,
      bool verified,
      List<Comment> comments,
      PostStatus status});

  $PropertyCopyWith<$Res> get property;
  $UserCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? avgStar = null,
    Object? content = freezed,
    Object? createdAt = null,
    Object? property = null,
    Object? createdBy = null,
    Object? expiredAt = null,
    Object? verified = null,
    Object? comments = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      avgStar: null == avgStar
          ? _value.avgStar
          : avgStar // ignore: cast_nullable_to_non_nullable
              as int,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      property: null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostStatus,
    ) as $Val);
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyCopyWith<$Res> get property {
    return $PropertyCopyWith<$Res>(_value.property, (value) {
      return _then(_value.copyWith(property: value) as $Val);
    });
  }

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get createdBy {
    return $UserCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      int avgStar,
      String? content,
      DateTime createdAt,
      Property property,
      User createdBy,
      DateTime expiredAt,
      bool verified,
      List<Comment> comments,
      PostStatus status});

  @override
  $PropertyCopyWith<$Res> get property;
  @override
  $UserCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? avgStar = null,
    Object? content = freezed,
    Object? createdAt = null,
    Object? property = null,
    Object? createdBy = null,
    Object? expiredAt = null,
    Object? verified = null,
    Object? comments = null,
    Object? status = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      avgStar: null == avgStar
          ? _value.avgStar
          : avgStar // ignore: cast_nullable_to_non_nullable
              as int,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      property: null == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.id,
      required this.title,
      required this.avgStar,
      this.content,
      required this.createdAt,
      required this.property,
      required this.createdBy,
      required this.expiredAt,
      required this.verified,
      required final List<Comment> comments,
      required this.status})
      : _comments = comments;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final int avgStar;
  @override
  final String? content;
  @override
  final DateTime createdAt;
  @override
  final Property property;
  @override
  final User createdBy;
  @override
  final DateTime expiredAt;
  @override
  final bool verified;
  final List<Comment> _comments;
  @override
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  final PostStatus status;

  @override
  String toString() {
    return 'Post(id: $id, title: $title, avgStar: $avgStar, content: $content, createdAt: $createdAt, property: $property, createdBy: $createdBy, expiredAt: $expiredAt, verified: $verified, comments: $comments, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.avgStar, avgStar) || other.avgStar == avgStar) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      avgStar,
      content,
      createdAt,
      property,
      createdBy,
      expiredAt,
      verified,
      const DeepCollectionEquality().hash(_comments),
      status);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String id,
      required final String title,
      required final int avgStar,
      final String? content,
      required final DateTime createdAt,
      required final Property property,
      required final User createdBy,
      required final DateTime expiredAt,
      required final bool verified,
      required final List<Comment> comments,
      required final PostStatus status}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  int get avgStar;
  @override
  String? get content;
  @override
  DateTime get createdAt;
  @override
  Property get property;
  @override
  User get createdBy;
  @override
  DateTime get expiredAt;
  @override
  bool get verified;
  @override
  List<Comment> get comments;
  @override
  PostStatus get status;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return _Property.fromJson(json);
}

/// @nodoc
mixin _$Property {
  String get address => throw _privateConstructorUsedError;
  Province? get province => throw _privateConstructorUsedError;
  District? get district => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get area => throw _privateConstructorUsedError;
  int get bedRoom => throw _privateConstructorUsedError;
  int get bathRoom => throw _privateConstructorUsedError;
  int get floor => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  bool get hasFurniture => throw _privateConstructorUsedError;
  PropertyType get propertyType => throw _privateConstructorUsedError;
  Direction get direction => throw _privateConstructorUsedError;

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyCopyWith<Property> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyCopyWith<$Res> {
  factory $PropertyCopyWith(Property value, $Res Function(Property) then) =
      _$PropertyCopyWithImpl<$Res, Property>;
  @useResult
  $Res call(
      {String address,
      Province? province,
      District? district,
      double price,
      double area,
      int bedRoom,
      int bathRoom,
      int floor,
      String description,
      List<String> images,
      bool hasFurniture,
      PropertyType propertyType,
      Direction direction});

  $ProvinceCopyWith<$Res>? get province;
  $DistrictCopyWith<$Res>? get district;
}

/// @nodoc
class _$PropertyCopyWithImpl<$Res, $Val extends Property>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? province = freezed,
    Object? district = freezed,
    Object? price = null,
    Object? area = null,
    Object? bedRoom = null,
    Object? bathRoom = null,
    Object? floor = null,
    Object? description = null,
    Object? images = null,
    Object? hasFurniture = null,
    Object? propertyType = null,
    Object? direction = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Province?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      bedRoom: null == bedRoom
          ? _value.bedRoom
          : bedRoom // ignore: cast_nullable_to_non_nullable
              as int,
      bathRoom: null == bathRoom
          ? _value.bathRoom
          : bathRoom // ignore: cast_nullable_to_non_nullable
              as int,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasFurniture: null == hasFurniture
          ? _value.hasFurniture
          : hasFurniture // ignore: cast_nullable_to_non_nullable
              as bool,
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyType,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
    ) as $Val);
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProvinceCopyWith<$Res>? get province {
    if (_value.province == null) {
      return null;
    }

    return $ProvinceCopyWith<$Res>(_value.province!, (value) {
      return _then(_value.copyWith(province: value) as $Val);
    });
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $DistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PropertyImplCopyWith<$Res>
    implements $PropertyCopyWith<$Res> {
  factory _$$PropertyImplCopyWith(
          _$PropertyImpl value, $Res Function(_$PropertyImpl) then) =
      __$$PropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      Province? province,
      District? district,
      double price,
      double area,
      int bedRoom,
      int bathRoom,
      int floor,
      String description,
      List<String> images,
      bool hasFurniture,
      PropertyType propertyType,
      Direction direction});

  @override
  $ProvinceCopyWith<$Res>? get province;
  @override
  $DistrictCopyWith<$Res>? get district;
}

/// @nodoc
class __$$PropertyImplCopyWithImpl<$Res>
    extends _$PropertyCopyWithImpl<$Res, _$PropertyImpl>
    implements _$$PropertyImplCopyWith<$Res> {
  __$$PropertyImplCopyWithImpl(
      _$PropertyImpl _value, $Res Function(_$PropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? province = freezed,
    Object? district = freezed,
    Object? price = null,
    Object? area = null,
    Object? bedRoom = null,
    Object? bathRoom = null,
    Object? floor = null,
    Object? description = null,
    Object? images = null,
    Object? hasFurniture = null,
    Object? propertyType = null,
    Object? direction = null,
  }) {
    return _then(_$PropertyImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      province: freezed == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as Province?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as District?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double,
      bedRoom: null == bedRoom
          ? _value.bedRoom
          : bedRoom // ignore: cast_nullable_to_non_nullable
              as int,
      bathRoom: null == bathRoom
          ? _value.bathRoom
          : bathRoom // ignore: cast_nullable_to_non_nullable
              as int,
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hasFurniture: null == hasFurniture
          ? _value.hasFurniture
          : hasFurniture // ignore: cast_nullable_to_non_nullable
              as bool,
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyType,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Direction,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyImpl implements _Property {
  const _$PropertyImpl(
      {required this.address,
      this.province,
      this.district,
      required this.price,
      required this.area,
      required this.bedRoom,
      required this.bathRoom,
      required this.floor,
      required this.description,
      required final List<String> images,
      required this.hasFurniture,
      required this.propertyType,
      required this.direction})
      : _images = images;

  factory _$PropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyImplFromJson(json);

  @override
  final String address;
  @override
  final Province? province;
  @override
  final District? district;
  @override
  final double price;
  @override
  final double area;
  @override
  final int bedRoom;
  @override
  final int bathRoom;
  @override
  final int floor;
  @override
  final String description;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final bool hasFurniture;
  @override
  final PropertyType propertyType;
  @override
  final Direction direction;

  @override
  String toString() {
    return 'Property(address: $address, province: $province, district: $district, price: $price, area: $area, bedRoom: $bedRoom, bathRoom: $bathRoom, floor: $floor, description: $description, images: $images, hasFurniture: $hasFurniture, propertyType: $propertyType, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.bedRoom, bedRoom) || other.bedRoom == bedRoom) &&
            (identical(other.bathRoom, bathRoom) ||
                other.bathRoom == bathRoom) &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.hasFurniture, hasFurniture) ||
                other.hasFurniture == hasFurniture) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      province,
      district,
      price,
      area,
      bedRoom,
      bathRoom,
      floor,
      description,
      const DeepCollectionEquality().hash(_images),
      hasFurniture,
      propertyType,
      direction);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      __$$PropertyImplCopyWithImpl<_$PropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyImplToJson(
      this,
    );
  }
}

abstract class _Property implements Property {
  const factory _Property(
      {required final String address,
      final Province? province,
      final District? district,
      required final double price,
      required final double area,
      required final int bedRoom,
      required final int bathRoom,
      required final int floor,
      required final String description,
      required final List<String> images,
      required final bool hasFurniture,
      required final PropertyType propertyType,
      required final Direction direction}) = _$PropertyImpl;

  factory _Property.fromJson(Map<String, dynamic> json) =
      _$PropertyImpl.fromJson;

  @override
  String get address;
  @override
  Province? get province;
  @override
  District? get district;
  @override
  double get price;
  @override
  double get area;
  @override
  int get bedRoom;
  @override
  int get bathRoom;
  @override
  int get floor;
  @override
  String get description;
  @override
  List<String> get images;
  @override
  bool get hasFurniture;
  @override
  PropertyType get propertyType;
  @override
  Direction get direction;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return _Province.fromJson(json);
}

/// @nodoc
mixin _$Province {
  String get name => throw _privateConstructorUsedError;
  List<District> get districts => throw _privateConstructorUsedError;

  /// Serializes this Province to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Province
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinceCopyWith<Province> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceCopyWith<$Res> {
  factory $ProvinceCopyWith(Province value, $Res Function(Province) then) =
      _$ProvinceCopyWithImpl<$Res, Province>;
  @useResult
  $Res call({String name, List<District> districts});
}

/// @nodoc
class _$ProvinceCopyWithImpl<$Res, $Val extends Province>
    implements $ProvinceCopyWith<$Res> {
  _$ProvinceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Province
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? districts = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      districts: null == districts
          ? _value.districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvinceImplCopyWith<$Res>
    implements $ProvinceCopyWith<$Res> {
  factory _$$ProvinceImplCopyWith(
          _$ProvinceImpl value, $Res Function(_$ProvinceImpl) then) =
      __$$ProvinceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<District> districts});
}

/// @nodoc
class __$$ProvinceImplCopyWithImpl<$Res>
    extends _$ProvinceCopyWithImpl<$Res, _$ProvinceImpl>
    implements _$$ProvinceImplCopyWith<$Res> {
  __$$ProvinceImplCopyWithImpl(
      _$ProvinceImpl _value, $Res Function(_$ProvinceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Province
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? districts = null,
  }) {
    return _then(_$ProvinceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      districts: null == districts
          ? _value._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProvinceImpl implements _Province {
  const _$ProvinceImpl(
      {required this.name, required final List<District> districts})
      : _districts = districts;

  factory _$ProvinceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProvinceImplFromJson(json);

  @override
  final String name;
  final List<District> _districts;
  @override
  List<District> get districts {
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districts);
  }

  @override
  String toString() {
    return 'Province(name: $name, districts: $districts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_districts));

  /// Create a copy of Province
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceImplCopyWith<_$ProvinceImpl> get copyWith =>
      __$$ProvinceImplCopyWithImpl<_$ProvinceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProvinceImplToJson(
      this,
    );
  }
}

abstract class _Province implements Province {
  const factory _Province(
      {required final String name,
      required final List<District> districts}) = _$ProvinceImpl;

  factory _Province.fromJson(Map<String, dynamic> json) =
      _$ProvinceImpl.fromJson;

  @override
  String get name;
  @override
  List<District> get districts;

  /// Create a copy of Province
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceImplCopyWith<_$ProvinceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this District to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DistrictImplCopyWith<$Res>
    implements $DistrictCopyWith<$Res> {
  factory _$$DistrictImplCopyWith(
          _$DistrictImpl value, $Res Function(_$DistrictImpl) then) =
      __$$DistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$DistrictImplCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$DistrictImpl>
    implements _$$DistrictImplCopyWith<$Res> {
  __$$DistrictImplCopyWithImpl(
      _$DistrictImpl _value, $Res Function(_$DistrictImpl) _then)
      : super(_value, _then);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$DistrictImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DistrictImpl implements _District {
  const _$DistrictImpl({required this.name});

  factory _$DistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DistrictImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'District(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DistrictImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      __$$DistrictImplCopyWithImpl<_$DistrictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DistrictImplToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District({required final String name}) = _$DistrictImpl;

  factory _District.fromJson(Map<String, dynamic> json) =
      _$DistrictImpl.fromJson;

  @override
  String get name;

  /// Create a copy of District
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DistrictImplCopyWith<_$DistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  User get createdBy => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call({String id, String content, DateTime createdAt, User createdBy});

  $UserCopyWith<$Res> get createdBy;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? createdBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get createdBy {
    return $UserCopyWith<$Res>(_value.createdBy, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String content, DateTime createdAt, User createdBy});

  @override
  $UserCopyWith<$Res> get createdBy;
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdAt = null,
    Object? createdBy = null,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.createdBy});

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final User createdBy;

  @override
  String toString() {
    return 'Comment(id: $id, content: $content, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, createdAt, createdBy);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String id,
      required final String content,
      required final DateTime createdAt,
      required final User createdBy}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  User get createdBy;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
