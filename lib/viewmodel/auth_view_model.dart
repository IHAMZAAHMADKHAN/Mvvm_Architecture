// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore, avoid_types_as_parameter_names

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture/models/user_model.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  bool _Signup_loading = false;
  bool get Signup_loading => _Signup_loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setSignUpLoading(bool value) {
    _Signup_loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          setLoading(false);
          final userpreference = Provider.of<UserViewModel>(
            context,
            listen: false,
          );
          userpreference.saveUser(UserModel(token: value["token"].toString()));
          // ignore: use_build_context_synchronously
          Utils.flushBarErrorMessage("LogIn Sucessfull", context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            // ignore: use_build_context_synchronously

            setLoading(false);
            print(value.toString());
          }
        })
        .onError((error, StackTrace) {
          if (kDebugMode) {
            setLoading(false);
            Utils.flushBarErrorMessage(error.toString(), context);
            print(error.toString());
          }
        });
  }

  Future<void> SignUpapi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.SignUpEndPoint(data)
        .then((value) {
          setSignUpLoading(false);
          Utils.flushBarErrorMessage("SignUp Sucessfull", context);
          Navigator.pushNamed(context, RoutesName.home);
          if (kDebugMode) {
            // ignore: use_build_context_synchronously

            setSignUpLoading(false);
            print(value.toString());
          }
        })
        .onError((error, StackTrace) {
          if (kDebugMode) {
            setSignUpLoading(false);
            Utils.flushBarErrorMessage(error.toString(), context);
            print(error.toString());
          }
        });
  }
}
