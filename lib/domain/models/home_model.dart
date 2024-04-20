class HomeModel {
  HomeModel({
    required this.name,
    required this.brewery,
    required this.rating,
  });

  final String name;
  final String brewery;
  final double rating;

  @override
  String toString() {
    return '$name, $brewery, Rating: $rating';
  }
}
