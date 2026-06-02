class BooksModel {
  final String id;
  final String imagepath;
  final String name;
  final String descapation;
  final String price;
  final String count;
  final String lasttime;

  BooksModel({
    required this.id,
    required this.imagepath,
    required this.name,
    required this.descapation,
    required this.price,
    required this.count,
    required this.lasttime,
  });
  factory BooksModel.fromjson(Map<String, dynamic> json) {
    return BooksModel(
      id: json["id"],
      imagepath: json["imagepath"],
      name: json["title"],
      descapation: json["descrapation"],
      price: json["price"],
      count: json["count"],
      lasttime: json["last time"],
    );
  }

  Map<String , dynamic> tojson() {
    return {
      "id": id,
      "imagepath": imagepath,
      "title": name,
      "descrapation": descapation,
      "price": price,
      "count": count,
      "last time": lasttime,
    };
  }
}
