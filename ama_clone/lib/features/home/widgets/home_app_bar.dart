import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

PreferredSizeWidget homeAppBar = PreferredSize(
  preferredSize: const Size.fromHeight(60),
  child: AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 42,
            margin: const EdgeInsets.only(left: 15),
            child: Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 1,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 6),
                        child:
                            Icon(Icons.search, color: Colors.black, size: 23),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(top: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                      borderSide: BorderSide(color: Colors.black38, width: 1),
                    ),
                    hintText: ' Search Trxplore.com',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    )),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          height: 42,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Icon(
            Icons.mic,
            color: Colors.black,
            size: 25,
          ),
        )
      ],
    ),
  ),
);
