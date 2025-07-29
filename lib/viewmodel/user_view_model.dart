import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  // Optional: Cache the user in memory
  UserModel? _user;

  // Save user token to SharedPreferences
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString("token", user.token ?? '');
    _user = user;
    notifyListeners();
    return true;
  }

  // Retrieve user token from SharedPreferences
  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");

    return UserModel(token: token);
  }

  // Remove token from SharedPreferences (logout)
  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove("token");
    _user = null;
    notifyListeners();
    return true;
  }
}
