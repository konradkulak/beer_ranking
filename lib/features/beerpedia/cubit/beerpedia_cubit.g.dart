// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beerpedia_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeerpediaStateImpl _$$BeerpediaStateImplFromJson(Map<String, dynamic> json) =>
    _$BeerpediaStateImpl(
      beerpediaModel: json['beerpediaModel'] == null
          ? null
          : BeerpediaModel.fromJson(
              json['beerpediaModel'] as Map<String, dynamic>),
      beerpediaStatus: $enumDecodeNullable(
          _$BeerpediaStatusEnumMap, json['beerpediaStatus']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$BeerpediaStateImplToJson(
        _$BeerpediaStateImpl instance) =>
    <String, dynamic>{
      'beerpediaModel': instance.beerpediaModel,
      'beerpediaStatus': _$BeerpediaStatusEnumMap[instance.beerpediaStatus],
      'errorMessage': instance.errorMessage,
    };

const _$BeerpediaStatusEnumMap = {
  BeerpediaStatus.initial: 'initial',
  BeerpediaStatus.loading: 'loading',
  BeerpediaStatus.success: 'success',
  BeerpediaStatus.error: 'error',
};
