class HomeModel {
  HomeModel({
    required this.name,
    required this.brewery,
    required this.rating,
    required this.date,
    required this.imageURL,
    required this.id,
  });

  final String name;
  final String brewery;
  final double rating;
  final DateTime date;
  final String imageURL;
  final String id;

  HomeModel.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? 'Unknown',
        brewery = map['brewery'] ?? 'Unknown',
        rating = map['rating']?.toDouble() ?? 0.0,
        date = map['date'],
        imageURL = map['image_url'] ?? '',
        id = map['id'] ?? '';
}
