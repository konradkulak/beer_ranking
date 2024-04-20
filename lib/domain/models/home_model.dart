class HomeModel {
  HomeModel({
    required this.name,
    required this.brewery,
    required this.rating,
  });

  final String name;
  final String brewery;
  final double rating;

  HomeModel.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? 'Unknown',
        brewery = map['brewery'] ?? 'Unknown',
        rating = map['rating']?.toDouble() ?? 0.0;
}

