import 'package:freezed_annotation/freezed_annotation.dart';

part 'beerpedia_model.freezed.dart';
part 'beerpedia_model.g.dart';

@freezed
class BeerpediaModel with _$BeerpediaModel {
  const BeerpediaModel._();
  factory BeerpediaModel(
    String title,
    String alcohol,
    String description,
    String country,
  ) = _BeerpediaModel;

  String get formattedDescription {
    return _formatDescription(description);
  }

  String get capitalizedCountry {
    return _capitalizeFirstLetter(country);
  }

  String _formatDescription(String description) {
    return description.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  String _capitalizeFirstLetter(String country) {
    if (country.isEmpty) return country;
    return country[0].toUpperCase() + country.substring(1);
  }

  factory BeerpediaModel.fromJson(Map<String, dynamic> json) =>
      _$BeerpediaModelFromJson(json);
}
