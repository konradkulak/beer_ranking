// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InfoStateImpl _$$InfoStateImplFromJson(Map<String, dynamic> json) =>
    _$InfoStateImpl(
      beer: json['beer'] == null
          ? null
          : BeerModel.fromJson(json['beer'] as Map<String, dynamic>),
      infoStatus: $enumDecodeNullable(_$InfoStatusEnumMap, json['infoStatus']),
      imageStatus: $enumDecode(_$ImageStatusEnumMap, json['imageStatus']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$InfoStateImplToJson(_$InfoStateImpl instance) =>
    <String, dynamic>{
      'beer': instance.beer,
      'infoStatus': _$InfoStatusEnumMap[instance.infoStatus],
      'imageStatus': _$ImageStatusEnumMap[instance.imageStatus]!,
      'errorMessage': instance.errorMessage,
    };

const _$InfoStatusEnumMap = {
  InfoStatus.loading: 'loading',
  InfoStatus.success: 'success',
  InfoStatus.error: 'error',
};

const _$ImageStatusEnumMap = {
  ImageStatus.valid: 'valid',
  ImageStatus.missing: 'missing',
  ImageStatus.malformed: 'malformed',
  ImageStatus.dataURI: 'dataURI',
};
