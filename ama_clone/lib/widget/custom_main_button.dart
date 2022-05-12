import 'package:ama_clone/utils/color_themes.dart';
import 'package:ama_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;
  final bool isLoading;
  const CustomMainButton({
    Key? key,
    required this.child,
    required this.color,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize:
            Size(ScrnSizer.screenWidth() * .5, ScrnSizer.screenHeight() * .059),
      ),
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: backgroundColor,
                ),
              ))
          : child,
      onPressed: onPressed,
    );
  }
}
