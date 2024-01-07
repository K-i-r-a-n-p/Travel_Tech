import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project/ScreenHome.dart';
import 'package:software_project/ScreenLogin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    gotoLogin();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Image.asset(
            "assests/SplashImage.png", // Adjust the path according to your assets
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }

  Future<void> gotoLogin() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  _isLoggedIn ? const ScreenHome() : const MyLoginPage()));
    });
  }
}
