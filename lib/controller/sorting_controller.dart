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
    List<ProductModel>? allProduct = await Api_Helper.api_Helper.getApi();

    allProduct?.sort(
      (a, b) => a.title.toLowerCase().compareTo(
            b.title.toLowerCase(),
          ),
    );

    log("$allProduct");

    update();
  }

  zToaSorting() async {
    List<ProductModel>? allProduct = await Api_Helper.api_Helper.getApi();

    allProduct?.sort(
      (a, b) => b.title.toLowerCase().compareTo(
            a.title.toLowerCase(),
          ),
    );
    update();
  }
}
