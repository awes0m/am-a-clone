import 'dart:convert';

import 'package:ama_clone/constants/error_handling.dart';
import 'package:ama_clone/constants/global_variables.dart';
import 'package:ama_clone/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../models/user.dart';

class AuthService {
  // Sign up User
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (!context.mounted) {
        return;
      }
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account Created : Login with same credentials!');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      if (!context.mounted) {
        return;
      }
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            print(res.body);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
