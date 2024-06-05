// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddStateImpl _$$AddStateImplFromJson(Map<String, dynamic> json) =>
    _$AddStateImpl(
      beer: json['beer'] == null
          ? null
          : BeerModel.fromJson(json['beer'] as Map<String, dynamic>),
      addStatus: $enumDecodeNullable(_$AddStatusEnumMap, json['addStatus']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$AddStateImplToJson(_$AddStateImpl instance) =>
    <String, dynamic>{
      'beer': instance.beer,
      'addStatus': _$AddStatusEnumMap[instance.addStatus],
      'errorMessage': instance.errorMessage,
    };

const _$AddStatusEnumMap = {
  AddStatus.loading: 'loading',
  AddStatus.success: 'success',
  AddStatus.error: 'error',
};
