class Clothe {
  String id = '';
  String title = '';
  List<dynamic> parts = [];
  String imagePath = '';

  Clothe(this.id, this.title, this.parts, this.imagePath);

  Clothe.fromJson(Map<String, dynamic> json) {
    this.id = json['id'] ?? '0';
    this.title = json['title'] ?? '';
    this.parts = json['parts'] ?? [];
    this.imagePath = json['imagePath'] ?? '';
  }
}
