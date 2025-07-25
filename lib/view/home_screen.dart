import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Column(
          children: [
            Text("Home Scree"),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, RoutesName.login),
              child: Text("Go to login Screen"),
            ),
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
          ],
        ),
      ),
    );
  }
}
