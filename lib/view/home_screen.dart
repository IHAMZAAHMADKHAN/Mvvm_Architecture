import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resource/component/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';

import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userprefernce = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Scree"),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Utils.toastMessage("Hello i am toast");
              },
              child: Text("Toast"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Utils.flushBarErrorMessage("Hello i am flash", context);
              },
              child: Text("flash"),
            ),
            SizedBox(height: 50),
            RoundButton(
              title: "Log Out",
              onPress: () {
                userprefernce.removeUser().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
