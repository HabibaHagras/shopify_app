class Product {
  String? id;
  String? url;

  String? categoryId;
  String? description;
  String? name;
  double? price;
  int? quantity;

  Product();

  Product.fromJson(Map<String, dynamic> data,[String? docId]) {
    id = docId;
    url = data['url'];

    categoryId = data['categoryId'];
    description = data['description'];
    name = data['name'];
    price = data['price'];
    quantity = data['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "url": url,
      "categoryId": categoryId,
      "description": description,
      "name": name,
      "price": price,
      "quantity": quantity,
    };
  }
}
