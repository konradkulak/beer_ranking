// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beerpedia_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BeerpediaModel _$BeerpediaModelFromJson(Map<String, dynamic> json) {
  return _BeerpediaModel.fromJson(json);
}

/// @nodoc
mixin _$BeerpediaModel {
  String get title => throw _privateConstructorUsedError;
  String get alcohol => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerpediaModelCopyWith<BeerpediaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerpediaModelCopyWith<$Res> {
  factory $BeerpediaModelCopyWith(
          BeerpediaModel value, $Res Function(BeerpediaModel) then) =
      _$BeerpediaModelCopyWithImpl<$Res, BeerpediaModel>;
  @useResult
  $Res call({String title, String alcohol, String description, String country});
}

/// @nodoc
class _$BeerpediaModelCopyWithImpl<$Res, $Val extends BeerpediaModel>
    implements $BeerpediaModelCopyWith<$Res> {
  _$BeerpediaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? alcohol = null,
    Object? description = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      alcohol: null == alcohol
          ? _value.alcohol
          : alcohol // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeerpediaModelImplCopyWith<$Res>
    implements $BeerpediaModelCopyWith<$Res> {
  factory _$$BeerpediaModelImplCopyWith(_$BeerpediaModelImpl value,
          $Res Function(_$BeerpediaModelImpl) then) =
      __$$BeerpediaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String alcohol, String description, String country});
}

/// @nodoc
class __$$BeerpediaModelImplCopyWithImpl<$Res>
    extends _$BeerpediaModelCopyWithImpl<$Res, _$BeerpediaModelImpl>
    implements _$$BeerpediaModelImplCopyWith<$Res> {
  __$$BeerpediaModelImplCopyWithImpl(
      _$BeerpediaModelImpl _value, $Res Function(_$BeerpediaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? alcohol = null,
    Object? description = null,
    Object? country = null,
  }) {
    return _then(_$BeerpediaModelImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == alcohol
          ? _value.alcohol
          : alcohol // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeerpediaModelImpl extends _BeerpediaModel {
  _$BeerpediaModelImpl(this.title, this.alcohol, this.description, this.country)
      : super._();

  factory _$BeerpediaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeerpediaModelImplFromJson(json);

  @override
  final String title;
  @override
  final String alcohol;
  @override
  final String description;
  @override
  final String country;

  @override
  String toString() {
    return 'BeerpediaModel(title: $title, alcohol: $alcohol, description: $description, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeerpediaModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.alcohol, alcohol) || other.alcohol == alcohol) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, alcohol, description, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeerpediaModelImplCopyWith<_$BeerpediaModelImpl> get copyWith =>
      __$$BeerpediaModelImplCopyWithImpl<_$BeerpediaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeerpediaModelImplToJson(
      this,
    );
  }
}

abstract class _BeerpediaModel extends BeerpediaModel {
  factory _BeerpediaModel(final String title, final String alcohol,
      final String description, final String country) = _$BeerpediaModelImpl;
  _BeerpediaModel._() : super._();

  factory _BeerpediaModel.fromJson(Map<String, dynamic> json) =
      _$BeerpediaModelImpl.fromJson;

  @override
  String get title;
  @override
  String get alcohol;
  @override
  String get description;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$BeerpediaModelImplCopyWith<_$BeerpediaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
