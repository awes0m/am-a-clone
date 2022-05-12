import 'dart:developer';

import 'package:ama_clone/resources/authentication_methods.dart';
import 'package:flutter/material.dart';

import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signUp';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authMethods = AuthenticationMethods();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
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
                    ///Amazon Image
                    Image.network(
                      amazonLogo,
                      height: ScrnSizer.screenHeight() * 0.1,
                    ),

                    /// TextFields box
                    SizedBox(
                      height: ScrnSizer.screenHeight() * 0.65,
                      child: FittedBox(
                        child: Container(
                          height: ScrnSizer.screenHeight() * 0.8,
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
                              /// Sign up text
                              const Text(
                                'Sign-up',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 30),
                              ),

                              /// Name text field
                              TextFieldWidget(
                                  controller: nameController,
                                  hintText: "Enter your Name ",
                                  title: 'Name',
                                  obscureText: false),

                              /// email text field
                              TextFieldWidget(
                                  controller: emailController,
                                  hintText: "Enter your Email ",
                                  title: 'Email',
                                  obscureText: false),

                              TextFieldWidget(
                                  controller: addressController,
                                  hintText: "Enter your Address ",
                                  title: 'Address',
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
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 0.6),
                                  ),
                                  color: yellowColor,
                                  onPressed: () async {
                                    String output = await authMethods.signUp(
                                      name: nameController.text,
                                      email: emailController.text,
                                      address: addressController.text,
                                      password: passwordController.text,
                                    );

                                    if (output == 'success') {
                                      log("Doing next steps");
                                      //TODO: function to navigate to home screen
                                    } else {
                                      Utils.showSnackBar(
                                        context: context,
                                        message: output,
                                      );
                                    }
                                  },
                                  isLoading: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomMainButton(
                        child: const Text(
                          "back to Sign In",
                          style: TextStyle(color: Colors.black),
                        ),
                        color: Colors.grey[400]!,
                        isLoading: false,
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
