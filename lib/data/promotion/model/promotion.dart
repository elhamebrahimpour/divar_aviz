class Promotion {
  String title;
  String descryption;
  String image;
  String price;
  String? dateTime;

  Promotion({
    required this.title,
    required this.descryption,
    required this.image,
    required this.price,
    this.dateTime,
  });

  factory Promotion.fromJson(Map<String, dynamic> jsonObject) {
    return Promotion(
      title: jsonObject['title'],
      descryption: jsonObject['descryption'],
      image: jsonObject['image'],
      price: jsonObject['price'],
      dateTime: jsonObject['dateTime'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'descryption': descryption,
        'image': title,
        'price': price,
      };
}
