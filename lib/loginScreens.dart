// ignore_for_file: unused_local_variable, use_build_context_synchronously, file_names, library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:genmmas/menuScreens.dart';
import 'package:genmmas/services/services.dart';
import 'package:genmmas/signUp.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;

  var otpToken;

  final formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  final String _homeScreenText = "Waiting for token...";
  String fcmToken = "";

  void _doSomething() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _btnController.start();
      });

      try {
        // print('Attempting to log in...');
        String? token = await Services.instance
            .loginApp(emailController.text, passwordController.text);

        setState(() {
          _btnController.stop();
        });

        if (token != null) {
          // Save the token using shared_preferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          print('Token saved: $token');

          // Navigate to the MenuScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const MenuScreen(),
            ),
          );
        } else {
          _showErrorDialog('Login Gagal');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error during login: $e');
        }
        setState(() {
          _btnController.stop();
        });
        _showErrorDialog('An error occurred: $e');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Shader lineargradient = const LinearGradient(colors: <Color>[
      Color(0xFF1254A0),
      Color(0xFF15bae8),
    ]).createShader(const Rect.fromLTWH(0, 0, 200, 70));

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          _btnController.stop();
          return 'Mohon diisi menggunakan username/email yang valid';
        }
        return null;
      },
      autofocus: false,
      controller: emailController,
      decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: "Username/email",
          contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          border: InputBorder.none),
    );

    final password = TextFormField(
      autofocus: false,
      controller: passwordController,
      //initialValue: 'some password',
      validator: (value) {
        if (value == null || value.isEmpty) {
          _btnController.stop();
          return 'Mohon diisi menggunakan Password yang valid';
        }
        return null;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: 'Password',
          // errorText: 'Salah password',
          suffixIcon: IconButton(
              icon: isPasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () =>
                  setState(() => isPasswordVisible = !isPasswordVisible)),
          contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          border: InputBorder.none),
      obscureText: isPasswordVisible,
    );

    Widget buildSignUp() {
      return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            const SizedBox(height: 5),
            RichText(
              text: TextSpan(
                //  style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                    text: "Belum memiliki Akun? ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  TextSpan(
                      text: ' Buat Akun',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 19, 212, 42),
                          fontSize: 12),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
                        }),
                ],
              ),
            ),
          ],
        ),
      );
    }

    final loginButton = RoundedLoadingButton(
      color: const Color.fromARGB(255, 19, 212, 42),
      controller: _btnController,
      onPressed: _doSomething,
      child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 212, 42),
              borderRadius: BorderRadius.circular(30)),
          child: const Center(
              child: Text("Masuk", style: TextStyle(color: Colors.white)))),
    );

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 19, 212, 42),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: const EdgeInsets.only(bottom: 70),
                  child: const Image(
                    width: 200,
                    image: AssetImage(
                      "assets/icon2.png",
                    ),
                  ),
                ),
              ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 25, 20),
                        child: Form(
                          key: formKey,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Masuk",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: email,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: password,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                loginButton,
                                Center(
                                  // padding: EdgeInsets.fromLTRB(60, 530, 50, 30),
                                  child: buildSignUp(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
