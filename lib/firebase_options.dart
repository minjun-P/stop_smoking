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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuwB9KODkqXU0swuMMWKpP9P-TDL2_1eE',
    appId: '1:1086166118602:android:f3b935dd3f1663f0cac433',
    messagingSenderId: '1086166118602',
    projectId: 'hey-stop-smoking',
    storageBucket: 'hey-stop-smoking.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPoHWFVhGgQW2_sCC-wBDS8vJfCT9tpDc',
    appId: '1:1086166118602:ios:8a009798cf165c48cac433',
    messagingSenderId: '1086166118602',
    projectId: 'hey-stop-smoking',
    storageBucket: 'hey-stop-smoking.appspot.com',
    iosClientId: '1086166118602-4dmb1ggnroap9v72qcl0sqr0i9u90plq.apps.googleusercontent.com',
    iosBundleId: 'com.example.stopSmoking',
  );
}