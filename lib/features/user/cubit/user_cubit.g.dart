// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      userStatus: $enumDecode(_$UserStatusEnumMap, json['userStatus']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'userStatus': _$UserStatusEnumMap[instance.userStatus]!,
      'errorMessage': instance.errorMessage,
    };

const _$UserStatusEnumMap = {
  UserStatus.initial: 'initial',
  UserStatus.loading: 'loading',
  UserStatus.success: 'success',
  UserStatus.error: 'error',
};
