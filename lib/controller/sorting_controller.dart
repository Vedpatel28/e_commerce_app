import 'package:e_commerce_app/helper/api_helper.dart';
import 'package:e_commerce_app/modals/product_modal.dart';
import 'package:get/get.dart';

class ShortingController extends GetxController {

  aTozSorting() async {
    List<ProductModel>? allProduct = await Api_Helper.api_Helper.getApi();


  }

}