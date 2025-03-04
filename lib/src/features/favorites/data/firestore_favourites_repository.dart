import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_line/src/features/favorites/data/favourites_repository.dart';

class FirestoreFavouritesRepository implements FavouritesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addFavourite(String userId, int movieId) async {
    try {
      final docRef = _firestore.collection('favourites').doc(userId);
      final doc = await docRef.get();
      if (doc.exists) {
        await docRef.update({
          'movieIds': FieldValue.arrayUnion([movieId])
        });
      } else {
        await docRef.set({
          'movieIds': [movieId]
        });
      }
    } catch (e) {
      throw Exception('Error adding favourite: $e');
    }
  }

  @override
  Future<void> removeFavourite(String userId, int movieId) async {
    try {
      final docRef = _firestore.collection('favourites').doc(userId);
      final doc = await docRef.get();
      if (doc.exists) {
        await docRef.update({
          'movieIds': FieldValue.arrayRemove([movieId])
        });
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error removing favourite: $e');
    }
  }

  @override
  Stream<List<int>> getFavourites(String userId) {
    return _firestore
        .collection('favourites')
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return List<int>.from(snapshot.data()?['movieIds'] ?? []);
      } else {
        return [];
      }
    });
  }

  @override
  Future<void> deleteAllFavourites(String userId) async {
    try {
      await _firestore.collection('favourites').doc(userId).delete();
    } catch (e) {
      throw Exception('Error deleting all favourites: $e');
    }
  }
}
