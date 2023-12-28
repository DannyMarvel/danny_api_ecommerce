import 'package:flutter/cupertino.dart';

import 'categories_model.dart';

//We use postman to confirm the api link
//Then we convert the Json result to a Dart Model via Google
class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  CategoriesModel? category;
  List<String>? images;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoriesModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }
  static List<ProductsModel> productsFromSnapshot(List productSnaphot) {
    // print("data ${productSnaphot[0]}");
    return productSnaphot.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
