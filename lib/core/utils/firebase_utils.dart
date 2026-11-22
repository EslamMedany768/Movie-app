import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/model/MovieDm.dart';
import 'package:movies_app/data/model/UserDm.dart';

@singleton
class FirebaseUtils {
  CollectionReference<UserDm> _getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserDm.userCollection)
        .withConverter<UserDm>(
          fromFirestore: (snapshot, options) =>
              UserDm.fromFireStore(snapshot.data()!),
          toFirestore: (value, options) => UserDm.toFireStore(value),
        );
  }

  CollectionReference<MovieDm> _getHistoryCollection(UserDm user) {
    return FirebaseFirestore.instance
        .collection(UserDm.userCollection)
        .doc(user.id)
        .collection(MovieDm.historyCollection)
        .withConverter<MovieDm>(
          fromFirestore: (snapshot, options) =>
              MovieDm.fromJson(snapshot.data()),
          toFirestore: (value, options) => MovieDm.toJson(value),
        );
  }

  Future<void> addUserToFireStore(UserDm user) async {
    var collection = _getUserCollection();
    return collection.doc(user.id).set(user);
  }

  Future<UserDm?> getUserFromFireStore(String uId) async {
    var collection = _getUserCollection();
    var response = await collection.doc(uId).get();
    return response.data();
  }

  Future<void> addHistoryMovies({
    required UserDm user,
    required MovieDm movie,
  }) async {
    var collection = _getHistoryCollection(user);
    return collection.doc(movie.id.toString()).set(movie);
  }

  Future<QuerySnapshot<MovieDm>> getMoviesHistory(UserDm user) async {
    var collection = _getHistoryCollection(user);
    var response = await collection.get();

    return response;
  }
}
