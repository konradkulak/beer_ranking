// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beerpedia_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BeerpediaState _$BeerpediaStateFromJson(Map<String, dynamic> json) {
  return _BeerpediaState.fromJson(json);
}

/// @nodoc
mixin _$BeerpediaState {
  BeerpediaModel? get beerpediaModel => throw _privateConstructorUsedError;
  BeerpediaStatus? get beerpediaStatus => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerpediaStateCopyWith<BeerpediaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerpediaStateCopyWith<$Res> {
  factory $BeerpediaStateCopyWith(
          BeerpediaState value, $Res Function(BeerpediaState) then) =
      _$BeerpediaStateCopyWithImpl<$Res, BeerpediaState>;
  @useResult
  $Res call(
      {BeerpediaModel? beerpediaModel,
      BeerpediaStatus? beerpediaStatus,
      String? errorMessage});

  $BeerpediaModelCopyWith<$Res>? get beerpediaModel;
}

/// @nodoc
class _$BeerpediaStateCopyWithImpl<$Res, $Val extends BeerpediaState>
    implements $BeerpediaStateCopyWith<$Res> {
  _$BeerpediaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beerpediaModel = freezed,
    Object? beerpediaStatus = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      beerpediaModel: freezed == beerpediaModel
          ? _value.beerpediaModel
          : beerpediaModel // ignore: cast_nullable_to_non_nullable
              as BeerpediaModel?,
      beerpediaStatus: freezed == beerpediaStatus
          ? _value.beerpediaStatus
          : beerpediaStatus // ignore: cast_nullable_to_non_nullable
              as BeerpediaStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerpediaModelCopyWith<$Res>? get beerpediaModel {
    if (_value.beerpediaModel == null) {
      return null;
    }

    return $BeerpediaModelCopyWith<$Res>(_value.beerpediaModel!, (value) {
      return _then(_value.copyWith(beerpediaModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BeerpediaStateImplCopyWith<$Res>
    implements $BeerpediaStateCopyWith<$Res> {
  factory _$$BeerpediaStateImplCopyWith(_$BeerpediaStateImpl value,
          $Res Function(_$BeerpediaStateImpl) then) =
      __$$BeerpediaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BeerpediaModel? beerpediaModel,
      BeerpediaStatus? beerpediaStatus,
      String? errorMessage});

  @override
  $BeerpediaModelCopyWith<$Res>? get beerpediaModel;
}

/// @nodoc
class __$$BeerpediaStateImplCopyWithImpl<$Res>
    extends _$BeerpediaStateCopyWithImpl<$Res, _$BeerpediaStateImpl>
    implements _$$BeerpediaStateImplCopyWith<$Res> {
  __$$BeerpediaStateImplCopyWithImpl(
      _$BeerpediaStateImpl _value, $Res Function(_$BeerpediaStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beerpediaModel = freezed,
    Object? beerpediaStatus = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BeerpediaStateImpl(
      beerpediaModel: freezed == beerpediaModel
          ? _value.beerpediaModel
          : beerpediaModel // ignore: cast_nullable_to_non_nullable
              as BeerpediaModel?,
      beerpediaStatus: freezed == beerpediaStatus
          ? _value.beerpediaStatus
          : beerpediaStatus // ignore: cast_nullable_to_non_nullable
              as BeerpediaStatus?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeerpediaStateImpl implements _BeerpediaState {
  const _$BeerpediaStateImpl(
      {this.beerpediaModel, this.beerpediaStatus, this.errorMessage});

  factory _$BeerpediaStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeerpediaStateImplFromJson(json);

  @override
  final BeerpediaModel? beerpediaModel;
  @override
  final BeerpediaStatus? beerpediaStatus;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BeerpediaState(beerpediaModel: $beerpediaModel, beerpediaStatus: $beerpediaStatus, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeerpediaStateImpl &&
            (identical(other.beerpediaModel, beerpediaModel) ||
                other.beerpediaModel == beerpediaModel) &&
            (identical(other.beerpediaStatus, beerpediaStatus) ||
                other.beerpediaStatus == beerpediaStatus) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, beerpediaModel, beerpediaStatus, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeerpediaStateImplCopyWith<_$BeerpediaStateImpl> get copyWith =>
      __$$BeerpediaStateImplCopyWithImpl<_$BeerpediaStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeerpediaStateImplToJson(
      this,
    );
  }
}

abstract class _BeerpediaState implements BeerpediaState {
  const factory _BeerpediaState(
      {final BeerpediaModel? beerpediaModel,
      final BeerpediaStatus? beerpediaStatus,
      final String? errorMessage}) = _$BeerpediaStateImpl;

  factory _BeerpediaState.fromJson(Map<String, dynamic> json) =
      _$BeerpediaStateImpl.fromJson;

  @override
  BeerpediaModel? get beerpediaModel;
  @override
  BeerpediaStatus? get beerpediaStatus;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$BeerpediaStateImplCopyWith<_$BeerpediaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
