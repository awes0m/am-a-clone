import 'package:flutter/material.dart';

import '../../../common/logo.dart';
import '../../../constants/global_variables.dart';

PreferredSizeWidget adminAppBar(
        {required String title, bool showLogo = true}) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: GlobalVariables.appBarGradient,
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showLogo)
              Container(
                alignment: Alignment.topLeft,
                child: logo,
              ),
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            )
          ],
        ),
      ),
    );
