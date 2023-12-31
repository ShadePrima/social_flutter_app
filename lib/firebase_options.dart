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
    apiKey: 'AIzaSyA2RxZavy1ZY9fpaufUbBZmY1xx311lbBE',
    appId: '1:370624456093:web:f798a0dfb41af179337b74',
    messagingSenderId: '370624456093',
    projectId: 'social-flutter-app-42337',
    authDomain: 'social-flutter-app-42337.firebaseapp.com',
    storageBucket: 'social-flutter-app-42337.appspot.com',
    measurementId: 'G-J972HCNE8D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf5sgHT_Qbie2eDwiARR-1wlTBvtQQJYs',
    appId: '1:370624456093:android:81125b291016cb94337b74',
    messagingSenderId: '370624456093',
    projectId: 'social-flutter-app-42337',
    storageBucket: 'social-flutter-app-42337.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDL9Vk-cc-XW79LnLQ8oJcl7QwaDM5tOfg',
    appId: '1:370624456093:ios:e25c4b8e203f0952337b74',
    messagingSenderId: '370624456093',
    projectId: 'social-flutter-app-42337',
    storageBucket: 'social-flutter-app-42337.appspot.com',
    iosBundleId: 'com.example.socialFlutterApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDL9Vk-cc-XW79LnLQ8oJcl7QwaDM5tOfg',
    appId: '1:370624456093:ios:9b187c56132477a4337b74',
    messagingSenderId: '370624456093',
    projectId: 'social-flutter-app-42337',
    storageBucket: 'social-flutter-app-42337.appspot.com',
    iosBundleId: 'com.example.socialFlutterApp.RunnerTests',
  );
}
