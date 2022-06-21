import 'package:ama_clone/utils/color_themes.dart';
import 'package:ama_clone/utils/constants.dart';
import 'package:ama_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          largeAds[currentIndex],
          fit: BoxFit.cover,
          // height: kAppBarHeight,
          width: double.infinity,
          color: Colors.black.withOpacity(0.5),
          colorBlendMode: BlendMode.lighten,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: ScrnSizer.screenWidth(),
            height: ScrnSizer.screenHeight() * 0.1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  backgroundColor,
                  backgroundColor.withOpacity(0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        )
      ],
    );
  }
}
