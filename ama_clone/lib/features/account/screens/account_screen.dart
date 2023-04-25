import 'package:ama_clone/features/account/widgets/below_app_bar.dart';
import 'package:ama_clone/features/account/widgets/orders.dart';
import 'package:ama_clone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/accounts_appbar.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: accountsAppBar,
      body: Column(
        children: const [
          BelowAppBar(),
          TopButtons(),
          Orders(),
        ],
      ),
    );
  }
}
