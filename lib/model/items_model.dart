class ItemsModel {
  late String id;
  late String title;
  late String img;
  late int totalPrice;
  late int sellingPrice;

  ItemsModel({
    required this.id,
    required this.title,
    required this.img,
    required this.totalPrice,
    required this.sellingPrice,
  });

  ItemsModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    img = map['img'];
    totalPrice = map['total_price'];
    sellingPrice = map['sell_price'];
  }
}
