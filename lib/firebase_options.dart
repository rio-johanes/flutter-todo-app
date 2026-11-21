import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  // Opsi Firebase yang sama dipakai untuk semua platform
  // (hanya ada google-services.json untuk Android)
  static const FirebaseOptions _options = FirebaseOptions(
    apiKey: 'AIzaSyDQix6lrn3vQeBjpgIva1ZUloN1h7KEzr8',
    appId: '1:799074472216:android:ea80002750cc0fbe040e6d',
    messagingSenderId: '799074472216',
    projectId: 'pertemuan6-bbb91',
    storageBucket: 'pertemuan6-bbb91.firebasestorage.app',
  );

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return _options;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.iOS:
        return _options;
      default:
        return _options;
    }
  }
}
