class BeerpediaModel {
  BeerpediaModel(
      {required this.beer,
      required this.brewery,
      required this.style,
      required this.country,
      required this.state,
      required this.score});

  final String beer;
  final String brewery;
  final String style;
  final String country;
  final String state;
  final double score;

  BeerpediaModel.fromJson(Map<String, dynamic> json)
      : beer = json['beer'],
        brewery = json['brewery'],
        style = json['style'],
        country = json['country'],
        state = json['state'],
        score = json['score'] + 0.0;
}
