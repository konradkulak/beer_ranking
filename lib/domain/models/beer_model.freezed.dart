// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BeerModel _$BeerModelFromJson(Map<String, dynamic> json) {
  return _BeerModel.fromJson(json);
}

/// @nodoc
mixin _$BeerModel {
  String get name => throw _privateConstructorUsedError;
  String get brewery => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get imageURL => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerModelCopyWith<BeerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerModelCopyWith<$Res> {
  factory $BeerModelCopyWith(BeerModel value, $Res Function(BeerModel) then) =
      _$BeerModelCopyWithImpl<$Res, BeerModel>;
  @useResult
  $Res call(
      {String name,
      String brewery,
      double rating,
      DateTime date,
      String imageURL,
      String id});
}

/// @nodoc
class _$BeerModelCopyWithImpl<$Res, $Val extends BeerModel>
    implements $BeerModelCopyWith<$Res> {
  _$BeerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brewery = null,
    Object? rating = null,
    Object? date = null,
    Object? imageURL = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brewery: null == brewery
          ? _value.brewery
          : brewery // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageURL: null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeerModelImplCopyWith<$Res>
    implements $BeerModelCopyWith<$Res> {
  factory _$$BeerModelImplCopyWith(
          _$BeerModelImpl value, $Res Function(_$BeerModelImpl) then) =
      __$$BeerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String brewery,
      double rating,
      DateTime date,
      String imageURL,
      String id});
}

/// @nodoc
class __$$BeerModelImplCopyWithImpl<$Res>
    extends _$BeerModelCopyWithImpl<$Res, _$BeerModelImpl>
    implements _$$BeerModelImplCopyWith<$Res> {
  __$$BeerModelImplCopyWithImpl(
      _$BeerModelImpl _value, $Res Function(_$BeerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brewery = null,
    Object? rating = null,
    Object? date = null,
    Object? imageURL = null,
    Object? id = null,
  }) {
    return _then(_$BeerModelImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == brewery
          ? _value.brewery
          : brewery // ignore: cast_nullable_to_non_nullable
              as String,
      null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeerModelImpl extends _BeerModel {
  _$BeerModelImpl(
      this.name, this.brewery, this.rating, this.date, this.imageURL, this.id)
      : super._();

  factory _$BeerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeerModelImplFromJson(json);

  @override
  final String name;
  @override
  final String brewery;
  @override
  final double rating;
  @override
  final DateTime date;
  @override
  final String imageURL;
  @override
  final String id;

  @override
  String toString() {
    return 'BeerModel(name: $name, brewery: $brewery, rating: $rating, date: $date, imageURL: $imageURL, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeerModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brewery, brewery) || other.brewery == brewery) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, brewery, rating, date, imageURL, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeerModelImplCopyWith<_$BeerModelImpl> get copyWith =>
      __$$BeerModelImplCopyWithImpl<_$BeerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeerModelImplToJson(
      this,
    );
  }
}

abstract class _BeerModel extends BeerModel {
  factory _BeerModel(
      final String name,
      final String brewery,
      final double rating,
      final DateTime date,
      final String imageURL,
      final String id) = _$BeerModelImpl;
  _BeerModel._() : super._();

  factory _BeerModel.fromJson(Map<String, dynamic> json) =
      _$BeerModelImpl.fromJson;

  @override
  String get name;
  @override
  String get brewery;
  @override
  double get rating;
  @override
  DateTime get date;
  @override
  String get imageURL;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$BeerModelImplCopyWith<_$BeerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
