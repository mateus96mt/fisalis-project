import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreController {
  static String collectionName = 'roupas';

  static final _fireStore = FirebaseFirestore.instance;

  static Future<QuerySnapshot<Map<String, dynamic>>> getClothes() {
    return _fireStore.collection(collectionName).get();
  }
}
