import 'package:get/get.dart';

class ProductModel {
  final String title;
  final String description;
  final int price;
  final String thumbnail;
  // final String category;
  // final double rating;
  RxInt totalItems = 1.obs;
  RxInt totalPrice = 0.obs;

  ProductModel(
    this.title,
    this.description,
    this.price,
    this.thumbnail,
    // this.rating,
    // // this.category,
  );

  factory ProductModel.fromMap({required Map product}) {
    return ProductModel(
      product['title'],
      product['description'],
      product['price'],
      product['thumbnail'],
      // product['rating'],
      // // product['category'],
    );
  }
}
