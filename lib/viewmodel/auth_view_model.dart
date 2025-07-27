import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) {
          setLoading(false);
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
}
