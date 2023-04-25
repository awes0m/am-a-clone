import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as gfont;

import '../../../constants/global_variables.dart';

PreferredSizeWidget authScreenAppBar = PreferredSize(
  preferredSize: const Size.fromHeight(50),
  child: AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          // gradient: GlobalVariables.appBarGradient,
          color: GlobalVariables.secondaryColor),
    ),
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        alignment: Alignment.topLeft,
        child: Text(
          'Hello Adventurer !',
          style: gfont.GoogleFonts.caveat(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    ]),
  ),
);
