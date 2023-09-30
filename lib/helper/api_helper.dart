// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:e_commerce_app/modals/product_modal.dart';

class Api_Helper {
  Api_Helper._();

  static final Api_Helper api_Helper = Api_Helper._();

  Future<List<ProductModel>?> getApi() async {
    Dio dio = Dio();

    String api = "https://dummyjson.com/products?limit=100";

    Response response = await dio.get(api);

    if (response.statusCode == 200) {
      List allProduct = response.data['products'];

      List<ProductModel> listOfProduct = allProduct
          .map(
            (e) => ProductModel.fromMap(
              product: e,
            ),
          )
          .toList();

      return listOfProduct;
    }
  }
}
