// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddState _$AddStateFromJson(Map<String, dynamic> json) {
  return _AddState.fromJson(json);
}

/// @nodoc
mixin _$AddState {
  BeerModel? get beer => throw _privateConstructorUsedError;
  AddStatus get addStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddStateCopyWith<AddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStateCopyWith<$Res> {
  factory $AddStateCopyWith(AddState value, $Res Function(AddState) then) =
      _$AddStateCopyWithImpl<$Res, AddState>;
  @useResult
  $Res call({BeerModel? beer, AddStatus addStatus, String? errorMessage});

  $BeerModelCopyWith<$Res>? get beer;
}

/// @nodoc
class _$AddStateCopyWithImpl<$Res, $Val extends AddState>
    implements $AddStateCopyWith<$Res> {
  _$AddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beer = freezed,
    Object? addStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as BeerModel?,
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as AddStatus,
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
abstract class _$$AddStateImplCopyWith<$Res>
    implements $AddStateCopyWith<$Res> {
  factory _$$AddStateImplCopyWith(
          _$AddStateImpl value, $Res Function(_$AddStateImpl) then) =
      __$$AddStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerModel? beer, AddStatus addStatus, String? errorMessage});

  @override
  $BeerModelCopyWith<$Res>? get beer;
}

/// @nodoc
class __$$AddStateImplCopyWithImpl<$Res>
    extends _$AddStateCopyWithImpl<$Res, _$AddStateImpl>
    implements _$$AddStateImplCopyWith<$Res> {
  __$$AddStateImplCopyWithImpl(
      _$AddStateImpl _value, $Res Function(_$AddStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beer = freezed,
    Object? addStatus = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AddStateImpl(
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as BeerModel?,
      addStatus: null == addStatus
          ? _value.addStatus
          : addStatus // ignore: cast_nullable_to_non_nullable
              as AddStatus,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddStateImpl implements _AddState {
  const _$AddStateImpl(
      {this.beer, this.addStatus = AddStatus.initial, this.errorMessage});

  factory _$AddStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddStateImplFromJson(json);

  @override
  final BeerModel? beer;
  @override
  @JsonKey()
  final AddStatus addStatus;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddState(beer: $beer, addStatus: $addStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStateImpl &&
            (identical(other.beer, beer) || other.beer == beer) &&
            (identical(other.addStatus, addStatus) ||
                other.addStatus == addStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, beer, addStatus, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStateImplCopyWith<_$AddStateImpl> get copyWith =>
      __$$AddStateImplCopyWithImpl<_$AddStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddStateImplToJson(
      this,
    );
  }
}

abstract class _AddState implements AddState {
  const factory _AddState(
      {final BeerModel? beer,
      final AddStatus addStatus,
      final String? errorMessage}) = _$AddStateImpl;

  factory _AddState.fromJson(Map<String, dynamic> json) =
      _$AddStateImpl.fromJson;

  @override
  BeerModel? get beer;
  @override
  AddStatus get addStatus;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AddStateImplCopyWith<_$AddStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
