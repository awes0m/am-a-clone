import 'package:ama_clone/screens/sign_in_screen.dart';
import 'package:ama_clone/screens/sign_up_screen.dart';
import 'package:ama_clone/utils/color_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBeo9cTiOjk_ibwxZKwjs19YbLd930pDQo",
            authDomain: "amaclone-8d190.firebaseapp.com",
            projectId: "amaclone-8d190",
            storageBucket: "amaclone-8d190.appspot.com",
            messagingSenderId: "125284922789",
            appId: "1:125284922789:web:0c3206dd217ee002a3a44c",
            measurementId: "G-ZZ8SWSF2X5"));
  } else {
    Firebase.initializeApp();
  }

  runApp(const AmaClone());
}

class AmaClone extends StatelessWidget {
  const AmaClone({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ama Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const SignInScreen(),
      routes: {
        SignInScreen.routeName: (context) => const SignUpScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen()
      },
    );
  }
}
