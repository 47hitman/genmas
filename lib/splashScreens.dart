// ignore_for_file: unused_field, unused_element

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:genmmas/loginScreens.dart';
import 'package:genmmas/menuScreens.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:geolocator/geolocator.dart';

// import '../menu.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";

  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    print(token);
    if (token == null) {
      Timer(const Duration(seconds: 3), () {
        _navigateToLoginScreen();
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        _navigateToMenuScreen();
      });
    }
  }

  void _navigateToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
    );
  }

  void _navigateToMenuScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const MenuScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 19, 212, 42),
            Color.fromARGB(255, 11, 155, 1),
          ],
        ),
      ),
      child: Center(
        child: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Image(
                      width: 200,
                      image: AssetImage(
                        "assets/icon.gif",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "GEMMAS",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Transform.translate(
                  offset: const Offset(0, 10),
                  child: const SizedBox(
                    width: double.infinity,
                    // child: SvgPicture.asset(
                    //   assetName,
                    //   semanticsLabel: 'background',
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Powered By Gemmas",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                ),
              )
            ],
          )
        ]),
      ),
    ));
  }
}
