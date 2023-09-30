import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/utils/get_page_utils.dart';
import 'package:e_commerce_app/views/screens/cart_page.dart';
import 'package:e_commerce_app/views/screens/detail_page.dart';
import 'package:e_commerce_app/views/screens/favourite_page.dart';
import 'package:e_commerce_app/views/screens/home_page.dart';
import 'package:e_commerce_app/views/screens/login_page.dart';
import 'package:e_commerce_app/views/screens/sign_in_page.dart';
import 'package:e_commerce_app/views/screens/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: AllScreens.splash,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: AllScreens.login,
          page: () => const LoginPage(),
        ),
        GetPage(
          name: AllScreens.signIn,
          page: () => const SignInPage(),
        ),
        GetPage(
          name: AllScreens.home,
          page: () => const HomePage(),
        ),
        GetPage(
          name: AllScreens.favourite,
          page: () => const FavouritePage(),
        ),
        GetPage(
          name: AllScreens.cart,
          page: () => const CartPage(),
        ),
        GetPage(
          name: AllScreens.detail,
          page: () => const DetailPage(),
        ),
      ],
    );
  }
}
