import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/viewmodel/user_view_model.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();

    try {
      UserModel user = await userViewModel.getUser();

      Timer(const Duration(seconds: 2), () {
        if (user.token != null && user.token!.isNotEmpty) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.home,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.login,
            (route) => false,
          );
        }
      });
    } catch (error) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.login,
          (route) => false,
        );
      });

      // Optional: log the error
      debugPrint('SplashServices Error: $error');
    }
  }
}
