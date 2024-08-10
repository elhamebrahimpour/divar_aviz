class Promotion {
  String title;
  String descryption;
  String image;
  String price;

  Promotion({
    required this.title,
    required this.descryption,
    required this.image,
    required this.price,
  });

  factory Promotion.fromJson(Map<String, dynamic> jsonObject) {
    return Promotion(
      title: jsonObject['title'],
      descryption: jsonObject['descryption'],
      image: jsonObject['image'],
      price: jsonObject['price'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'descryption': descryption,
        'image': title,
        'price': price,
      };
}
