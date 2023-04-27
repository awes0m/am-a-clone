import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../models/product.dart';
import 'package:flutter/material.dart';

import '../../../provider/user_provider.dart';

class HomeServices {
  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    void errorHandler(res, productList) => httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          },
        );
    List<Product> productList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products?category=$category'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      errorHandler(res, productList);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
