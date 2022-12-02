import 'package:ama_clone/features/home/widgets/carousel_image.dart';
import 'package:ama_clone/features/home/widgets/deal_of_the_day.dart';
import 'package:ama_clone/features/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';

import '../widgets/address_box.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBox(),
            SizedBox(height: 10),
            TopCategories(),
            SizedBox(height: 10),
            CarouselImage(),
            DealOfDay()
          ],
        ),
      ),
    );
  }
}
