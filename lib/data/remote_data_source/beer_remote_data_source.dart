import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeerRemoteDataSource {
  Stream<List<Map<String, dynamic>>> getBeerStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('rating', descending: true)
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

  Future<void> addItem(BeerModel beer) async {
    try {
      await FirebaseFirestore.instance.collection('items').add(beer.toMap());
    } catch (error) {
      throw Exception(
        'Failed to add item: ${error.toString()}',
      );
    }
  }

  Future<BeerModel> getBeerID(String id) async {
    try {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('items').doc(id).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        if (data['date'] is Timestamp) {
          data['date'] = (data['date'] as Timestamp).toDate();
        }
        return BeerModel.fromMap(data);
      } else {
        throw Exception('Beer not found');
      }
    } catch (error) {
      throw Exception('Failed to load item: ${error.toString()}');
    }
  }
}
