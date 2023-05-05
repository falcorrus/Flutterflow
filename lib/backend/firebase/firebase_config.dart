import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBz8CxA6A7K_dwHbynB2V1c83Tq0wgmLcY",
            authDomain: "happydelivery-44ca6.firebaseapp.com",
            projectId: "happydelivery-44ca6",
            storageBucket: "happydelivery-44ca6.appspot.com",
            messagingSenderId: "875446636613",
            appId: "1:875446636613:web:e4518eedd75cc04490932c",
            measurementId: "G-N2TRH1GBVV"));
  } else {
    await Firebase.initializeApp();
  }
}
