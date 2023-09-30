import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/controller/sorting_controller.dart';
import 'package:e_commerce_app/helper/api_helper.dart';
import 'package:e_commerce_app/modals/product_modal.dart';
import 'package:e_commerce_app/utils/get_page_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    CartController cartController = Get.put(
      CartController(),
    );

    ShortingController shortingController = Get.put(ShortingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Commerce"),
        centerTitle: true,
        backgroundColor: const Color(0xFFE6E9ED),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Sorting
              Container(
                height: s.height * 0.08,
                margin: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          shortingController.aTozSorting();
                        },
                        child: Container(
                          height: s.height * 0.08,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.only(
                            left: 18,
                            right: 18,
                          ),
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            "A to Z",
                            style: GoogleFonts.comme(
                              fontSize: s.height * 0.02,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          shortingController.zToaSorting();
                        },
                        child: Container(
                          height: s.height * 0.08,
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.only(
                            left: 18,
                            right: 18,
                          ),
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            "Z to A",
                            style: GoogleFonts.comme(
                              fontSize: s.height * 0.02,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: s.height * 0.08,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          "by Rating",
                          style: GoogleFonts.comme(
                            fontSize: s.height * 0.02,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        height: s.height * 0.08,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          "Price High to Low",
                          style: GoogleFonts.comme(
                            fontSize: s.height * 0.02,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        height: s.height * 0.08,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                        ),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          "Price Low to High",
                          style: GoogleFonts.comme(
                            fontSize: s.height * 0.02,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // All Products
              SizedBox(
                height: s.height * 0.9,
                child: FutureBuilder(
                  future: shortingController.fetchAllProduct(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return Obx(
                        () {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 3,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemCount: snapShot.data!.length,
                            itemBuilder: (context, index) {
                              ProductModel product = snapShot.data![index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    AllScreens.detail,
                                    arguments: product,
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft:
                                                Radius.elliptical(120, 40),
                                            bottomRight:
                                                Radius.elliptical(40, 120),
                                          ),
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(product.thumbnail),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(12),
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text(
                                          product.title,
                                          style: GoogleFonts.comme(
                                            fontSize: s.height * 0.018,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 50,
                                              alignment: Alignment.center,
                                              child:
                                                  Text("\$ ${product.price}"),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                if (cartController.cartItems
                                                    .contains(product)) {
                                                  Get.snackbar(
                                                    product.title,
                                                    "Already added",
                                                  );
                                                  Get.toNamed(AllScreens.cart);
                                                } else {
                                                  cartController.addProduct(
                                                    product: product,
                                                  );
                                                  Get.snackbar(
                                                    product.title,
                                                    "add In Cart",
                                                  );
                                                  Get.toNamed(AllScreens.cart);
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.shopping_bag_outlined,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapShot.hasError) {
                      return Text("${snapShot.error}");
                    } else {
                      return Center(
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/Images/eCommerce-Website.gif"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AllScreens.cart);
        },
        child: const Icon(
          Icons.shopping_bag,
        ),
      ),
      backgroundColor: const Color(0xFFE6E9ED),
    );
  }
}
