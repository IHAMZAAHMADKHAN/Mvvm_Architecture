import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static double averageRating(List<int> rating) {
    int total = 0;
    for (var i = 0; i < rating.length; i++) {
      total += rating[i];
    }
    return double.parse((total / rating.length).toStringAsFixed(1));
  }

  // we will use this function to shift focus from one text field to another text field
  // we are using to avoid duplications of code
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: Colors.black87,
      flushbarPosition: FlushbarPosition.BOTTOM,
      message: message,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error, color: Colors.redAccent),
    ).show(context);
  }
}
