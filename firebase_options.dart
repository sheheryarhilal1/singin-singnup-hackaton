// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyC3iZvKcR69I6JW3hUaEBXXCmN9AxGcwpU',
    appId: '1:467636750018:web:42f0d391b0f7b3f2f81d5b',
    messagingSenderId: '467636750018',
    projectId: 'appp-8dd1e',
    authDomain: 'appp-8dd1e.firebaseapp.com',
    storageBucket: 'appp-8dd1e.appspot.com',
    measurementId: 'G-YNLTT2GB2E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYti0mwY5pntbdCmFJJWxeP8lM-vsPQAw',
    appId: '1:467636750018:android:0272e7d98eef0059f81d5b',
    messagingSenderId: '467636750018',
    projectId: 'appp-8dd1e',
    storageBucket: 'appp-8dd1e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJGLOUEQJIq0cE-AjTOzaxMqQM2JEP5PA',
    appId: '1:467636750018:ios:c58e465267530dd9f81d5b',
    messagingSenderId: '467636750018',
    projectId: 'appp-8dd1e',
    storageBucket: 'appp-8dd1e.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJGLOUEQJIq0cE-AjTOzaxMqQM2JEP5PA',
    appId: '1:467636750018:ios:c58e465267530dd9f81d5b',
    messagingSenderId: '467636750018',
    projectId: 'appp-8dd1e',
    storageBucket: 'appp-8dd1e.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3iZvKcR69I6JW3hUaEBXXCmN9AxGcwpU',
    appId: '1:467636750018:web:c3d8204ad5444532f81d5b',
    messagingSenderId: '467636750018',
    projectId: 'appp-8dd1e',
    authDomain: 'appp-8dd1e.firebaseapp.com',
    storageBucket: 'appp-8dd1e.appspot.com',
    measurementId: 'G-WH85986MV8',
  );
}