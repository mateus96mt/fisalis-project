import 'package:sketch/controllers/firebase_firestore.controller.dart';
import 'package:sketch/models/product.dart';

class ProductServices {
  static Future<List<Product>> getClothes() async {
    return FirebaseFireStoreController.getClothes().then(
      (response) async {
        List<Product> clothes = [];
        for (var doc in response.docs) {
          // print(doc.data());
          Product clothe = Product.fromJson(doc.data());
          clothe.imageURL = FirebaseFireStoreController.getUrlToFirebaseStorageFIle(
              'data/${clothe.title}/${clothe.parts.types[0]}${clothe.parts.colors[0]}.png');
          clothes.add(
            clothe,
          );
        }
        return clothes;
      },
    );
  }
}
