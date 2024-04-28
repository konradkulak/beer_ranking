import 'package:beer_ranking/domain/models/beer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BeerRemoteDataSource {
  Stream<List<Map<String, dynamic>>> getBeerStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
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
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('items')
          .doc(id)
          .delete();
    } catch (error) {
      throw Exception(
        'Failed to delete item: ${error.toString()}',
      );
    }
  }

  Future<void> addItem(BeerModel beer) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('items')
          .add(beer.toMap());
    } catch (error) {
      throw Exception(
        'Failed to add item: ${error.toString()}',
      );
    }
  }

  Future<BeerModel> getBeerID(String id) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('items')
          .doc(id)
          .get();
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
