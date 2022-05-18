import 'package:ama_clone/utils/color_themes.dart';
import 'package:ama_clone/utils/constants.dart';
import 'package:ama_clone/utils/utils.dart';
import 'package:flutter/material.dart';

import '../screens/search_screen.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;

  SearchBarWidget(
      {Key? key, required this.isReadOnly, required this.hasBackButton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// Back button
          hasBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : Container(),

          /// Search bar
          SizedBox(
              width: ScrnSizer.screenWidth() * 0.7,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(0, 5),
                  )
                ]),
                child: TextField(
                  readOnly: isReadOnly,
                  onTap: () {
                    if (isReadOnly) {
                      Navigator.pushNamed(context, SearchScreen.routeName);
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Search Apisod.ama-clone',
                      fillColor: Colors.white,
                      filled: true,
                      border: border,
                      focusedBorder: border),
                ),
              )),

          /// voice Search button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mic_none_outlined),
          )
        ],
      ),
    );
  }
}
