import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_model.freezed.dart';
part 'beer_model.g.dart';

@freezed
class BeerModel with _$BeerModel {
  const BeerModel._();
  factory BeerModel(
  String name,
  String brewery,
  double rating,
  DateTime date,
  String imageURL,
  String id,
  ) = _BeerModel;

  String get dateFormatted {
    return DateFormat.yMMMMEEEEd().format(date);}

  factory BeerModel.fromJson(Map<String, dynamic> json) =>
      _$BeerModelFromJson(json);
}
