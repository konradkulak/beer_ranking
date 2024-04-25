class BeerPediaModel {
  BeerPediaModel(
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
}
