import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/modals/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: GoogleFonts.comme(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Obx(
              () => SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    ProductModel product = cartController.cartItems[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(product.thumbnail),
                        ),
                        title: Text(product.title),
                        subtitle: Container(
                          width: 60,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartController.decreaseItems(
                                    product: product,
                                  );
                                },
                                icon: const Icon(
                                    Icons.remove_circle_outline_sharp),
                              ),
                              Obx(
                                () => Text("${product.totalItems}"),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartController.increaseItems(
                                      product: product);
                                },
                                icon:
                                    const Icon(Icons.add_circle_outline_sharp),
                              ),
                            ],
                          ),
                        ),
                        trailing: Obx(
                          () => Text(
                              "\$ ${cartController.totalAmount(product: product)}"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            Obx(
              () => SizedBox(
                height: 24,
                child: Text("Total Amount \$ ${cartController.pay}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
