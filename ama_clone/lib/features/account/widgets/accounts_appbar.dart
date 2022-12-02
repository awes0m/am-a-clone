import 'package:flutter/material.dart';

import '../../../common/logo.dart';
import '../../../constants/global_variables.dart';

PreferredSizeWidget accountsAppBar = PreferredSize(
  preferredSize: const Size.fromHeight(50),
  child: AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: logo,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Icon(Icons.notifications_outlined),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: const Icon(Icons.search),
            ),
          ],
        )
      ],
    ),
  ),
);
