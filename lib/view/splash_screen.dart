import 'package:flutter/material.dart';
import 'package:mvvm_architecture/viewmodel/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context); // ✅ Call auth check
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ✅ Center content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Splash Screen", style: TextStyle(fontSize: 50)),
            const SizedBox(height: 20),
            CircularProgressIndicator(), // Optional loading spinner
          ],
        ),
      ),
    );
  }
}
