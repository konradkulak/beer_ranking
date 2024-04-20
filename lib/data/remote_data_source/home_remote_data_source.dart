import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRemoteDataSource {
  Stream<List<Map<String, dynamic>>> getHomeStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['date'] = (data['date'] as Timestamp).toDate();
        return data;
      }).toList();
    });
  }
}
