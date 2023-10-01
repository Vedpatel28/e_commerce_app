// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:e_commerce_app/helper/api_helper.dart';
import 'package:e_commerce_app/modals/product_modal.dart';
import 'package:get/get.dart';

class ShortingController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;

  Future<RxList<ProductModel>> fetchAllProduct() async {
    products(
      await Api_Helper.api_Helper.getApi(),
    );
    return products;
  }

  aTozSorting() async {
    products
        .sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));

    log("$products");

    update();
  }

  zToaSorting() async {
    products.sort(
      (a, b) => b.title.toLowerCase().compareTo(
            a.title.toLowerCase(),
          ),
    );
    update();
  }

  aTozSortCategory() {
    products.sort(
        (a, b) => a.category.toLowerCase().compareTo(b.category.toLowerCase()));
  }

  zToaSortCategory() {
    products.sort(
        (a, b) => b.category.toLowerCase().compareTo(a.category.toLowerCase()));
  }

  lTohSortPrice() {
    products.sort((a, b) => a.price.compareTo(b.price));
  }

  hTolSortPrice() {
    products.sort((a, b) => b.price.compareTo(a.price));
  }

  sortByRating() {
    int index = 0;
    products.sort((a, b) {
      if (double.parse(a.rating.toString()) <
          double.parse(b.rating.toString())) {
        ++index;
        return 0;
      } else {
        return 1;
      }
    });
  }
}
