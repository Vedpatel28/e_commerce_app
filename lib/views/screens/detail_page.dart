import 'package:e_commerce_app/modals/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  ProductModel product = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E Commerce Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    product.thumbnail,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              product.title,
              style: GoogleFonts.adventPro(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "\$ ${product.price}",
              style: GoogleFonts.adventPro(
                fontSize: 28,
                letterSpacing: 2,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              product.description,
              style: GoogleFonts.adventPro(
                fontSize: 26,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
