import 'dart:async';
import 'package:e_commerce_app/utils/get_page_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        Get.offNamed(AllScreens.home);
        timer.cancel();
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 250,
              backgroundColor: Colors.blue,
              foregroundImage: AssetImage(
                "assets/Images/splash screen .gif",
              ),

            ),
          ],
        ),
      ),
    );
  }
}
