import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD7lq-BQIwF1Oc9EHy8pcOJSDlXQf69UAc",
            authDomain: "cinnamon-nails.firebaseapp.com",
            projectId: "cinnamon-nails",
            storageBucket: "cinnamon-nails.firebasestorage.app",
            messagingSenderId: "460972102086",
            appId: "1:460972102086:web:5eb01acaa6f7999a8162c7"));
  } else {
    await Firebase.initializeApp();
  }
}
