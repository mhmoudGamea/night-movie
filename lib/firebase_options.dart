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
    apiKey: 'AIzaSyAxlwoNlv-YKq4jif_0zkKBiZyvd312fMo',
    appId: '1:751943964893:web:089fc87962ff40e68ee334',
    messagingSenderId: '751943964893',
    projectId: 'night-movie-f7aea',
    authDomain: 'night-movie-f7aea.firebaseapp.com',
    storageBucket: 'night-movie-f7aea.appspot.com',
    measurementId: 'G-PXCLWR533E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJ1l8TWdeHydglVsDvp1SEOFqWocialqs',
    appId: '1:751943964893:android:4323080a911e52608ee334',
    messagingSenderId: '751943964893',
    projectId: 'night-movie-f7aea',
    storageBucket: 'night-movie-f7aea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsTfPelifDiHNSIlbKYScxMd2icJCjINc',
    appId: '1:751943964893:ios:ec462af2c72814de8ee334',
    messagingSenderId: '751943964893',
    projectId: 'night-movie-f7aea',
    storageBucket: 'night-movie-f7aea.appspot.com',
    iosClientId: '751943964893-s9onlq8qf4hkssaqu2nfk4i52rbqm21e.apps.googleusercontent.com',
    iosBundleId: 'com.example.nightMovie',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCsTfPelifDiHNSIlbKYScxMd2icJCjINc',
    appId: '1:751943964893:ios:ec462af2c72814de8ee334',
    messagingSenderId: '751943964893',
    projectId: 'night-movie-f7aea',
    storageBucket: 'night-movie-f7aea.appspot.com',
    iosClientId: '751943964893-s9onlq8qf4hkssaqu2nfk4i52rbqm21e.apps.googleusercontent.com',
    iosBundleId: 'com.example.nightMovie',
  );
}
