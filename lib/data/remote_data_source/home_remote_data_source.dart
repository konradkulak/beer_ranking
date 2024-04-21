import 'package:cloud_firestore/cloud_firestore.dart';

class HomeRemoteDataSource {
  Stream<List<Map<String, dynamic>>> getHomeStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['date'] = data['date'] != null
            ? (data['date'] as Timestamp).toDate()
            : DateTime.now();
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  Future<void> deleteItem(String id) async {
    try {
      await FirebaseFirestore.instance.collection('items').doc(id).delete();
    } catch (error) {
      throw Exception(
        'Failed to delete item: ${error.toString()}',
      );
    }
  }
}
