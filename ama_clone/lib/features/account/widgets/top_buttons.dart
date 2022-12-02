import 'package:ama_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(children: [
          AccountButton(text: 'Your Trips', onTap: () {}),
          AccountButton(text: 'Turn Guide', onTap: () {})
        ]),
        const SizedBox(height: 10),
        Row(children: [
          AccountButton(text: 'WishList', onTap: () {}),
          AccountButton(text: 'Log out', onTap: () {})
        ]),
        const SizedBox(height: 10),
      ],
    );
  }
}
