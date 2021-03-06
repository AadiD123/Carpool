import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'Sugars': sugars,
      'Name': name,
      'Strength': strength,
    });
  }

  // get brews streams
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
