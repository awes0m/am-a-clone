import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../models/product.dart';
import '../../../provider/user_provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    void onSucess() {
      showSnackBar(context, 'Product added sucessfully');
      Navigator.pop(context);
    }

    void errorHandler(res) =>
        httpErrorHandle(response: res, context: context, onSuccess: onSucess);

    try {
      final CloudinaryPublic cloudinary =
          CloudinaryPublic('drbvz2qqk', 'dja6amxo');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );
      var res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );
      errorHandler(res);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    List<Product> productList = [];

    void onSucess(res) {
      for (int i = 0; i < jsonDecode(res.body).length; i++) {
        productList.add(Product.fromJson(jsonEncode(jsonDecode(res.body)[i])));
      }
    }

    void errorHandler(res) => httpErrorHandle(
        response: res, context: context, onSuccess: () => onSucess(res));

    try {
      Response response = await http.get(
        Uri.parse('$uri/admin/get-products'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      errorHandler(response);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
