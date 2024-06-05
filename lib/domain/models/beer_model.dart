import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_model.freezed.dart';
part 'beer_model.g.dart';

DateTime timestampToDateTime(Timestamp timestamp) => timestamp.toDate();
Timestamp dateTimeToTimestamp(DateTime date) => Timestamp.fromDate(date);

@freezed
class BeerModel with _$BeerModel {
  const BeerModel._();

  @JsonSerializable(explicitToJson: true)
  factory BeerModel({
    required String name,
    required String brewery,
    required double rating,
    @JsonKey(fromJson: timestampToDateTime, toJson: dateTimeToTimestamp)
    required DateTime date,
    required String imageURL,
    required String id,
  }) = _BeerModel;

  String get dateFormatted {
    return DateFormat.yMMMMEEEEd().format(date);
  }

  factory BeerModel.fromJson(Map<String, dynamic> json) =>
      _$BeerModelFromJson(json);
}
