// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BeerModelImpl _$$BeerModelImplFromJson(Map<String, dynamic> json) =>
    _$BeerModelImpl(
      name: json['name'] as String,
      brewery: json['brewery'] as String,
      rating: (json['rating'] as num).toDouble(),
      date: timestampToDateTime(json['date'] as Timestamp),
      imageURL: json['imageURL'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$BeerModelImplToJson(_$BeerModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brewery': instance.brewery,
      'rating': instance.rating,
      'date': dateTimeToTimestamp(instance.date),
      'imageURL': instance.imageURL,
      'id': instance.id,
    };
