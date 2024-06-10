// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => BeerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      deletionStatus:
          $enumDecodeNullable(_$DeletionStatusEnumMap, json['deletionStatus']),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'status': _$StatusEnumMap[instance.status]!,
      'deletionStatus': _$DeletionStatusEnumMap[instance.deletionStatus],
      'errorMessage': instance.errorMessage,
    };

const _$StatusEnumMap = {
  Status.initial: 'initial',
  Status.loading: 'loading',
  Status.success: 'success',
  Status.error: 'error',
};

const _$DeletionStatusEnumMap = {
  DeletionStatus.success: 'success',
  DeletionStatus.error: 'error',
};
