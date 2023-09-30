import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/helper/api_helper.dart';
import 'package:e_commerce_app/modals/product_modal.dart';
import 'package:e_commerce_app/utils/get_page_utils.dart';
import 'package:e_commerce_app/utils/image_utils.dart';
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
              // CarouselSlider
              SizedBox(
                width: s.width * 1,
                height: s.height * 0.24,
                child: CarouselSlider(
                  items: List.generate(
                    imagesList.length,
                    (index) => Container(
                      height: s.height * 0.1,
                      width: s.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("${imagesList[index]}"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(s.height * 0.02),
                        ),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    height: s.height * 0.3,
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ),
              ),
              SizedBox(height: s.height*0.02),
              // Category
              Container(
                height: s.height * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: const Row(
                  children: [],
                ),
              ),
              // All Products
              FutureBuilder(
                future: Api_Helper.api_Helper.getApi(),
                builder: (context, snapShot) {
                  if (snapShot.hasData) {
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
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.horizontal(
                                      right: Radius.elliptical(120, 700),
                                      left: Radius.elliptical(150, 500),
                                    ),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(product.thumbnail),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    product.title,
                                    style: GoogleFonts.comme(
                                      fontSize: s.height * 0.02,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Text("\$ ${product.price}"),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (cartController.cartItems
                                              .contains(product)) {
                                            Get.snackbar(
                                              product.title,
                                              "Already added",
                                              barBlur: 2,
                                              animationDuration:
                                                  const Duration(
                                                      milliseconds: 300),
                                              forwardAnimationCurve:
                                                  Curves.easeInOutQuad,
                                              onTap: (snack) {
                                                Get.toNamed(
                                                  AllScreens.cart,
                                                );
                                              },
                                              duration: const Duration(
                                                milliseconds: 1200,
                                              ),
                                            );
                                          } else {
                                            cartController.addProduct(
                                              product: product,
                                            );
                                            Get.snackbar(
                                              product.title,
                                              "add In Cart",
                                              barBlur: 2,
                                              animationDuration:
                                                  const Duration(
                                                      milliseconds: 300),
                                              forwardAnimationCurve:
                                                  Curves.easeInOutQuad,
                                              onTap: (snack) {
                                                Get.toNamed("/ecom_Cart");
                                              },
                                              duration: const Duration(
                                                milliseconds: 1200,
                                              ),
                                            );
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
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFE6E9ED),
    );
  }
}
