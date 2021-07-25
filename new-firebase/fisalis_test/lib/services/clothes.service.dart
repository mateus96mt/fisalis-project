import 'dart:convert';

import 'package:sketch/controllers/firebase_firestore.controller.dart';
import 'package:sketch/model/clothe.model.dart';

class ClothesServices {
  static Future<List<Clothe>> getClothes() async {
    return FirebaseFireStoreController.getClothes().then(
      (response) {
        List<Clothe> clothes = [];
        for (var doc in response.docs) {
          // print(doc.data());
          clothes.add(
            Clothe.fromJson(doc.data()),
          );
        }
        return clothes;
      },
    );
  }
}
