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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Text('Hello Bezos!'),
    );
  }
}
