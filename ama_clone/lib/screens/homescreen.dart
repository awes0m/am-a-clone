import 'package:ama_clone/resources/authentication_methods.dart';
import 'package:ama_clone/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text("Sign-out"),
      onPressed: () async {
        await signOut();
        Navigator.pushReplacementNamed(context, SignInScreen.routeName);
      },
    ));
  }
}
