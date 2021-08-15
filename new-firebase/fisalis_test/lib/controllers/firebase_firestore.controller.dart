import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_storage_web/firebase_storage_web.dart';
import 'package:sketch/utils/globals.dart';

class FirebaseFireStoreController {
  static String collectionName = 'roupas';

  static final _fireStore = FirebaseFirestore.instance;

  static final firebaseStorageWeb =
      FirebaseStorageWeb(bucket: 'gs://fisalis-test-d0330.appspot.com');

  // static final _firebaseAuth = FirebaseAuthWeb(app: app)

  static Future<QuerySnapshot<Map<String, dynamic>>> getClothes() {
    return _fireStore.collection(collectionName).get();
  }

  static Future<String> getClotheImageURL(String reference, String fileName) {
    // var image = FirebaseFireStoreController.firebaseStorageWeb.ref('/data/${clothe.title}').child('${clothe.parts.types[0]}${clothe.parts.colors[0]}.png');
    var image = FirebaseFireStoreController.firebaseStorageWeb
        .ref(reference)
        .child(fileName);

    return image.getDownloadURL();
  }

  // static Future<Uint8List?> getClotheImageBytes(
  //     String reference, String fileName) async {
  //   // final FirebaseStorage firebaseStorage = FirebaseStorage(
  //   //     app: Firestore.instance.app,
  //   //     storageBucket: 'gs://your-firebase-app-url.com');
  //
  //   return firebaseStorageWeb
  //       .ref(reference)
  //       .child(fileName)
  //       .getData(IMAGE_SIZE);
  // }
}
