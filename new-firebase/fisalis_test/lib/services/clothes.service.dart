import 'package:sketch/controllers/firebase_firestore.controller.dart';
import 'package:sketch/model/clothe.model.dart';

class ClothesServices {
  static Future<List<Clothe>> getClothes() async {
    return FirebaseFireStoreController.getClothes().then(
      (response) async {
        List<Clothe> clothes = [];
        for (var doc in response.docs) {
          // print(doc.data());
          Clothe clothe = Clothe.fromJson(doc.data());
          // await FirebaseFireStoreController.getClotheImageBytes(
          //         '/data/${clothe.title}',
          //         '${clothe.parts.types[0]}${clothe.parts.colors[0]}.png')
          //     .then((imageBytes) {
          //   // clothe.imageBytes = imageBytes;
          // });
          // await FirebaseFireStoreController.getClotheImageURL(
          //     '/data/${clothe.title}',
          //     '${clothe.parts.types[0]}${clothe.parts.colors[0]}.png')
          //     .then((url) {
          //   clothe.imageURL = url;
          // });
          clothes.add(
            clothe,
          );
        }
        return clothes;
      },
    );
  }
}
