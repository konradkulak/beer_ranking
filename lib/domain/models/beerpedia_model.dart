import 'package:freezed_annotation/freezed_annotation.dart';

part 'beerpedia_model.freezed.dart';
part 'beerpedia_model.g.dart';

@freezed
class BeerpediaModel with _$BeerpediaModel {
  factory BeerpediaModel(
    String title,
    String alcohol,
    String description,
    String country,
  ) = _BeerpediaModel;

  factory BeerpediaModel.fromJson(Map<String, dynamic> json) =>
      _$BeerpediaModelFromJson(json);
}

// class BeerpediaModel {
//   BeerpediaModel({
//     required this.title,
//     required this.alcohol,
//     required this.description,
//     required this.country,
//   });

//   final String title;
//   final String alcohol;
//   final String description;
//   final String country;

//   BeerpediaModel.fromJson(Map<String, dynamic> json)
//       : title = json['title'] ?? '',
//         alcohol = json['alcohol'] ?? '',
//         description = _formatDescription(json['description'] ?? ''),
//         country = _capitalizeFirstLetter(json['country'] ?? '');
// }

// String _formatDescription(String description) {
//   return description.replaceAll(RegExp(r'\s+'), ' ').trim();
// }

// String _capitalizeFirstLetter(String country) {
//   if (country.isEmpty) return country;
//   return country[0].toUpperCase() + country.substring(1);
// }
