import 'package:beer_ranking/domain/models/home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRepository {
  Stream<List<HomeModel>> getHomeStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(
        (doc) {
          return HomeModel(
            name: doc['name'] ?? 'Unknown',
            brewery: doc['brewery'] ?? 'Unknown',
            rating: doc['rating']?.toDouble() ?? 0.0,
          );
        },
      ).toList();
    });
  }
}
