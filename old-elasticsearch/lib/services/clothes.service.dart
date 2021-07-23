import 'package:sketch/controllers/elasticsearch.controller.dart';
import 'package:sketch/model/clothe.model.dart';

class ClothesServices {
  static Future<List<Clothe>> getClothes() async {
    return ElasticSearchController.getClothes().then(
      (response) {
        List<dynamic> clothesJson = response.data['hits']['hits'];
        List<Clothe> clothes = [];

        for (Map<String, dynamic> clotheJson in clothesJson) {
          clothes.add(Clothe.fromJson(clotheJson['_source']));
        }

        return clothes;
      },
    );
  }
}
