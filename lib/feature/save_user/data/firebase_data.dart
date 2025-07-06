import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class FirebaseData {
  static CollectionReference<UserModel> getUsers() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) => UserModel.fromJson(snapshot.data()!),

          toFirestore: (UserModel, options) => UserModel.toJson(),
        );
  }

  static Future<void> addUserToFireStore(UserModel users) {
    return getUsers().doc(users.id).set(users);
  }
}
