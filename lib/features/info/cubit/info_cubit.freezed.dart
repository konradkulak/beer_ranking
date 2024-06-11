// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InfoState _$InfoStateFromJson(Map<String, dynamic> json) {
  return _InfoState.fromJson(json);
}

/// @nodoc
mixin _$InfoState {
  BeerModel? get beer => throw _privateConstructorUsedError;
  InfoStatus? get infoStatus => throw _privateConstructorUsedError;
  ImageStatus get imageStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoStateCopyWith<InfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoStateCopyWith<$Res> {
  factory $InfoStateCopyWith(InfoState value, $Res Function(InfoState) then) =
      _$InfoStateCopyWithImpl<$Res, InfoState>;
  @useResult
  $Res call(
      {BeerModel? beer,
      InfoStatus? infoStatus,
      ImageStatus imageStatus,
      String? errorMessage});

  $BeerModelCopyWith<$Res>? get beer;
}

/// @nodoc
class _$InfoStateCopyWithImpl<$Res, $Val extends InfoState>
    implements $InfoStateCopyWith<$Res> {
  _$InfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beer = freezed,
    Object? infoStatus = freezed,
    Object? imageStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as BeerModel?,
      infoStatus: freezed == infoStatus
          ? _value.infoStatus
          : infoStatus // ignore: cast_nullable_to_non_nullable
              as InfoStatus?,
      imageStatus: null == imageStatus
          ? _value.imageStatus
          : imageStatus // ignore: cast_nullable_to_non_nullable
              as ImageStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerModelCopyWith<$Res>? get beer {
    if (_value.beer == null) {
      return null;
    }

    return $BeerModelCopyWith<$Res>(_value.beer!, (value) {
      return _then(_value.copyWith(beer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InfoStateImplCopyWith<$Res>
    implements $InfoStateCopyWith<$Res> {
  factory _$$InfoStateImplCopyWith(
          _$InfoStateImpl value, $Res Function(_$InfoStateImpl) then) =
      __$$InfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BeerModel? beer,
      InfoStatus? infoStatus,
      ImageStatus imageStatus,
      String? errorMessage});

  @override
  $BeerModelCopyWith<$Res>? get beer;
}

/// @nodoc
class __$$InfoStateImplCopyWithImpl<$Res>
    extends _$InfoStateCopyWithImpl<$Res, _$InfoStateImpl>
    implements _$$InfoStateImplCopyWith<$Res> {
  __$$InfoStateImplCopyWithImpl(
      _$InfoStateImpl _value, $Res Function(_$InfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beer = freezed,
    Object? infoStatus = freezed,
    Object? imageStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$InfoStateImpl(
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as BeerModel?,
      infoStatus: freezed == infoStatus
          ? _value.infoStatus
          : infoStatus // ignore: cast_nullable_to_non_nullable
              as InfoStatus?,
      imageStatus: null == imageStatus
          ? _value.imageStatus
          : imageStatus // ignore: cast_nullable_to_non_nullable
              as ImageStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoStateImpl implements _InfoState {
  const _$InfoStateImpl(
      {this.beer,
      this.infoStatus,
      required this.imageStatus,
      this.errorMessage});

  factory _$InfoStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoStateImplFromJson(json);

  @override
  final BeerModel? beer;
  @override
  final InfoStatus? infoStatus;
  @override
  final ImageStatus imageStatus;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'InfoState(beer: $beer, infoStatus: $infoStatus, imageStatus: $imageStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoStateImpl &&
            (identical(other.beer, beer) || other.beer == beer) &&
            (identical(other.infoStatus, infoStatus) ||
                other.infoStatus == infoStatus) &&
            (identical(other.imageStatus, imageStatus) ||
                other.imageStatus == imageStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, beer, infoStatus, imageStatus, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      __$$InfoStateImplCopyWithImpl<_$InfoStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoStateImplToJson(
      this,
    );
  }
}

abstract class _InfoState implements InfoState {
  const factory _InfoState(
      {final BeerModel? beer,
      final InfoStatus? infoStatus,
      required final ImageStatus imageStatus,
      final String? errorMessage}) = _$InfoStateImpl;

  factory _InfoState.fromJson(Map<String, dynamic> json) =
      _$InfoStateImpl.fromJson;

  @override
  BeerModel? get beer;
  @override
  InfoStatus? get infoStatus;
  @override
  ImageStatus get imageStatus;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$InfoStateImplCopyWith<_$InfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
