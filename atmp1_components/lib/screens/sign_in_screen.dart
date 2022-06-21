import 'dart:developer';

import 'package:flutter/material.dart';

import '../layout/screen_layout.dart';
import '../resources/authentication_methods.dart';
import 'sign_up_screen.dart';
import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../widgets/text_field_widget.dart';
import '../utils/utils.dart';
import '../widgets/custom_main_button.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signIn';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScrnSizer.screenHeight(),
          width: ScrnSizer.screenWidth(),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Amazon Logo Image
                    Image.network(
                      amazonLogo,
                      height: ScrnSizer.screenHeight() * 0.1,
                    ),

                    /// TextFields box
                    Container(
                      height: ScrnSizer.screenHeight() * 0.6,
                      width: ScrnSizer.screenWidth() * 0.8,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                      ),

                      /// the column contains the text and text fields to Sign in
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Sign in  Top text
                          const Text(
                            'Sign-In',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 30),
                          ),

                          /// email text field
                          TextFieldWidget(
                              controller: emailController,
                              hintText: "Enter your Email ",
                              title: 'Email',
                              obscureText: false),

                          /// password text field
                          TextFieldWidget(
                            controller: passwordController,
                            hintText: "Enter your Password ",
                            title: 'Password',
                            obscureText: true,
                          ),

                          /// sign in button
                          Align(
                            alignment: Alignment.center,
                            child: CustomMainButton(
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.black, letterSpacing: 0.6),
                              ),
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                String output = await authMethods.signIn(
                                    email: emailController.text,
                                    password: passwordController.text);

                                setState(() {
                                  isLoading = false;
                                });

                                if (output == 'success') {
                                  log('Doing next steps');
                                  Navigator.pushReplacementNamed(
                                      context, ScreenLayout.routeName);
                                } else {
                                  Utils.showSnackBar(
                                    context: context,
                                    message: output,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(color: Colors.grey, height: 1)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "New to Apisod?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                            child: Container(color: Colors.grey, height: 1)),
                      ],
                    ),
                    CustomMainButton(
                        child: const Text(
                          "Create a Apisod account",
                          style: TextStyle(color: Colors.black),
                        ),
                        color: Colors.grey[400]!,
                        isLoading: false,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpScreen.routeName);
                        })
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
