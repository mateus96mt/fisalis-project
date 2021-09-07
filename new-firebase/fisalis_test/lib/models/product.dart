class Product {
  String title = '';
  Parts parts = Parts();
  String imageURL = '';
  String imagePath = '';
  double price = 12.5;
  String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas felis ligula, sodales sit amet pharetra quis, finibus eget felis. Nullam laoreet, massa ac malesuada auctor, elit ipsum iaculis justo, id vestibulum sapien mauris nec elit. Donec elementum turpis vitae dolor interdum, in cursus turpis tempus. Donec urna metus, efficitur vel lacinia maximus, congue nec metus. Ut nec pulvinar ipsum. Curabitur eget euismod nunc. Suspendisse aliquam ligula dui. Vivamus facilisis consectetur tempor. Pellentesque metus odio, aliquet vitae varius non, mattis vel metus. Curabitur ultricies quam at est gravida, nec sollicitudin neque malesuada. Phasellus suscipit eu augue sed convallis. Nam gravida laoreet suscipit. Aenean commodo mauris ante, sed dignissim dolor cursus quis.";

  Product();

  Product.fromJson(Map<String, dynamic> json) {
    this.title = json['title'] ?? '';
    this.parts.types = json['parts']['types'] ?? '';
    this.parts.colors = json['parts']['colors'] ?? '';
  }
}

class Parts {
  List<dynamic> types = [];
  List<dynamic> colors = [];
}
