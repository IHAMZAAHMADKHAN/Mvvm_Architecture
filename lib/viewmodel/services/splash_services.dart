import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/viewmodel/user_view_model.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    final userViewModel = UserViewModel(); // ✅ Use final

    try {
      UserModel user = await userViewModel.getUser();

      // ✅ Add delay before navigation
      await Future.delayed(const Duration(seconds: 2));

      if (user.token != null && user.token!.isNotEmpty) {
        // ✅ Navigate to Home if token exists
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.home,
          (route) => false,
        );
      } else {
        // ✅ Navigate to Login if token is null or empty
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.login,
          (route) => false,
        );
      }
    } catch (error) {
      // ✅ Handle errors and still navigate to Login
      debugPrint('SplashServices Error: $error');

      await Future.delayed(const Duration(seconds: 2));

      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.login,
        (route) => false,
      );
    }
  }
}
