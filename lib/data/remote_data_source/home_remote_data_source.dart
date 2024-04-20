import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRemoteDataSource {
  Stream<List<Map<String, dynamic>>> getHomeStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
