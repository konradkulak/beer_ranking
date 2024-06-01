// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeerModelImpl _$$BeerModelImplFromJson(Map<String, dynamic> json) =>
    _$BeerModelImpl(
      json['name'] as String,
      json['brewery'] as String,
      (json['rating'] as num).toDouble(),
      DateTime.parse(json['date'] as String),
      json['imageURL'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$$BeerModelImplToJson(_$BeerModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brewery': instance.brewery,
      'rating': instance.rating,
      'date': instance.date.toIso8601String(),
      'imageURL': instance.imageURL,
      'id': instance.id,
    };
