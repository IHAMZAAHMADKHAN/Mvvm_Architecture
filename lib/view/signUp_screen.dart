// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resource/app_colors.dart';
import 'package:mvvm_architecture/resource/component/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ValueNotifier<bool> _obsecurepasswaord = ValueNotifier<bool>(true);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FocusNode emailfocusNode = FocusNode();
  FocusNode passfocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailfocusNode.dispose();
    passfocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  "SignUP to your account",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // Email TextField
                TextFormField(
                  controller: _emailController,
                  focusNode: emailfocusNode,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',

                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onFieldSubmitted: (valu) {
                    Utils.fieldFocusChange(
                      context,
                      emailfocusNode,
                      passfocusNode,
                    );
                  },
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: _obsecurepasswaord,
                  builder: (context, value, child) {
                    return // Password TextField
                    TextFormField(
                      controller: _passwordController,
                      focusNode: passfocusNode,
                      obscureText: _obsecurepasswaord.value,
                      decoration: InputDecoration(
                        hintText: 'Password',

                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                          onTap: () {
                            _obsecurepasswaord.value =
                                !_obsecurepasswaord.value;
                          },
                          child: Icon(
                            _obsecurepasswaord.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Login Button
                Center(
                  child: RoundButton(
                    loading: authViewModel.Signup_loading,
                    title: "SignUP",
                    onPress: () {
                      // Navigator.pushNamed(context, RoutesName.home);
                      if (_emailController.text.isEmpty) {
                        Utils.toastMessage("Please Enter Your Email");
                      } else if (_passwordController.text.isEmpty) {
                        Utils.toastMessage("Please Enter Your Password");
                      } else if (_passwordController.text.length < 6) {
                        Utils.toastMessage("Please Enter 6 digit  Password");
                      } else {
                        Map data = {
                          "email": _emailController.text.toString(),
                          "password": _passwordController.text.toString(),
                        };
                        authViewModel.SignUpapi(data, context);
                      }
                    },
                  ),
                ),

                // Forgot Password
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: const Text(
                      "Already Have Account? LogIN",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
