import 'package:ama_clone/widgets/banner_ad_widget.dart';
import 'package:ama_clone/widgets/categories_bar_listview.dart';

import '../widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CategoriesBarListView(),
            BannerAdWidget(),
          ],
        ),
      ),
    );
  }
}
