class Clothe {
  String title = '';
  Parts parts = Parts();
  String imagePath = '';

  Clothe(this.title, this.parts, this.imagePath);

  Clothe.fromJson(Map<String, dynamic> json) {
    // print("---------------PARSING---------------");
    // print(json['title']);
    // print(json['parts']['types']);
    // print(json['parts']['colors']);
    // print(json['imagePath']);
    // print("---------------PARSING---------------");
    this.title = json['title'] ?? '';
    this.parts.types = json['parts']['types'] ?? '';
    this.parts.colors = json['parts']['colors'] ?? '';
    this.imagePath = json['imagePath'] ?? '';
  }
}

class Parts {
  List<dynamic> types = [];
  List<dynamic> colors = [];
}
