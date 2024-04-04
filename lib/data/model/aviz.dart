class Aviz {
  String title;
  String descryption;
  String image;
  String price;

  Aviz({
    required this.title,
    required this.descryption,
    required this.image,
    required this.price,
  });

  factory Aviz.fromJson(Map<String, dynamic> jsonObject) {
    return Aviz(
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
