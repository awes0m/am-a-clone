import 'package:ama_clone/screens/sign_in_screen.dart';
import 'package:ama_clone/screens/sign_up_screen.dart';
import 'package:ama_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

void main() {
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
