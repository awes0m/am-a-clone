import 'package:flutter/material.dart';

/// This class is used to get the screen height and width
/// Functions- screenHeight() and screenWidth()
class ScrnSizer {
  /// return the current available screen height
  static double screenWidth() =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;

  /// return the current available screen width
  static double screenHeight() =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
}

class Utils {
  static showSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Color.fromARGB(255, 212, 85, 0),
      shape: const RoundedRectangleBorder(
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(10),
          //   topRight: Radius.circular(10),
          // ),
          ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
        ],
      ),
    ));
  }
}
