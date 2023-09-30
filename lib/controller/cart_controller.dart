import 'package:e_commerce_app/modals/product_modal.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  RxList<ProductModel> cartItems = <ProductModel>[].obs;
  int finelAmount = 0;
  RxInt pay = 0.obs;

  addProduct({required ProductModel product}) {
    cartItems.add(product);
    cartAmount();
  }

  removeProduct({required ProductModel product}) {
    cartItems.remove(product);
    cartAmount();
  }

  increaseItems({required ProductModel product}) {
    product.totalItems.value++;
    cartAmount();
    update();
  }

  decreaseItems({required ProductModel product}) {
    if (product.totalItems <= 1) {
      removeProduct(product: product);

      cartAmount();
    } else {
      product.totalItems.value--;
      cartAmount();
    }
    update();
  }

  totalAmount({required ProductModel product}) {
    finelAmount = product.totalItems.value * product.price;
    return finelAmount;
  }

  finelPay({required ProductModel product}) {
    finelAmount += product.price;
  }

  cartAmount() {
    pay.value = 0;

    for (var cartItem in cartItems) {
      pay.value = pay.value + cartItem.price * cartItem.totalItems.value;
    }
  }
}
