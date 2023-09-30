// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC55gk5ddueQv5GyZ3C2rh8E89h1d1pbIA',
    appId: '1:819389560531:web:92d76ab89b4d19aa6b8626',
    messagingSenderId: '819389560531',
    projectId: 'e-commerce-app-26a46',
    authDomain: 'e-commerce-app-26a46.firebaseapp.com',
    storageBucket: 'e-commerce-app-26a46.appspot.com',
    measurementId: 'G-FQNECJHS1V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5to-Jyz83O0zQ4pVa0qH03RZEB9JBLw0',
    appId: '1:819389560531:android:c99733a1a39736686b8626',
    messagingSenderId: '819389560531',
    projectId: 'e-commerce-app-26a46',
    storageBucket: 'e-commerce-app-26a46.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCcAqXINdpDdxcF4HxOdVug2IwzJ9q2FM',
    appId: '1:819389560531:ios:74eadd128346c4ed6b8626',
    messagingSenderId: '819389560531',
    projectId: 'e-commerce-app-26a46',
    storageBucket: 'e-commerce-app-26a46.appspot.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCcAqXINdpDdxcF4HxOdVug2IwzJ9q2FM',
    appId: '1:819389560531:ios:870e382fd66cd7326b8626',
    messagingSenderId: '819389560531',
    projectId: 'e-commerce-app-26a46',
    storageBucket: 'e-commerce-app-26a46.appspot.com',
    iosBundleId: 'com.example.eCommerceApp.RunnerTests',
  );
}
