import 'package:flutter/material.dart';

class CustomWideButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomWideButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      child: Text(text),
    );
  }
}
