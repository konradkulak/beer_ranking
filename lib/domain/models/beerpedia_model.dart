class BeerpediaModel {
  BeerpediaModel({
    required this.title,
    required this.alcohol,
    required this.description,
    required this.country,
  });

  final String title;
  final String alcohol;
  final String description;
  final String country;

  BeerpediaModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        alcohol = json['alchool'],
        description = _formatDescription(json['description']),
        country = _capitalizeFirstLetter(json['country']);
}

String _formatDescription(String description) {
  return description.replaceAll(RegExp(r'\s+'), ' ').trim();
}

String _capitalizeFirstLetter(String country) {
  if (country.isEmpty) return country;
  return country[0].toUpperCase() + country.substring(1).toLowerCase();
}
