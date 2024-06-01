// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beerpedia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeerpediaModelImpl _$$BeerpediaModelImplFromJson(Map<String, dynamic> json) =>
    _$BeerpediaModelImpl(
      json['title'] as String,
      json['alcohol'] as String,
      json['description'] as String,
      json['country'] as String,
    );

Map<String, dynamic> _$$BeerpediaModelImplToJson(
        _$BeerpediaModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'alcohol': instance.alcohol,
      'description': instance.description,
      'country': instance.country,
    };
