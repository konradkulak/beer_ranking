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
        description = json['description'],
        country = json['country'];
}
