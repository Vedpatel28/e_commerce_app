import 'package:get/get.dart';

class ProductModel {
  final String title;
  final String description;
  final int price;
  final String thumbnail;
  RxInt totalItems = 1.obs;
  RxInt totalPrice = 0.obs;

  ProductModel(
      this.title,
      this.description,
      this.price,
      this.thumbnail,
      );

  factory ProductModel.fromMap({required Map product}) {
    return ProductModel(
      product["title"],
      product["description"],
      product['price'],
      product['thumbnail'],
    );
  }
}