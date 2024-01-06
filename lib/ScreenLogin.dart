// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_project/ScreenForgotPass.dart';
import 'package:software_project/ScreenHome.dart';
import 'package:software_project/ScreenSignup.dart';
import 'package:software_project/fire_base_auth/fire_base_auth_services.dart';
import 'package:software_project/main.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isSigningIn = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ListView(
            children: [
              Image.asset(
                  "assests/travel-concept-with-baggage_23-2149153260.jpg"),
              const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                      hintText: "Email", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                      ))),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100, right: 100, bottom: 20, top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    _signIn();
                  },
                  child: isSigningIn
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Login",
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blueAccent),
                    )),
              ),
              const Center(child: Text("Don't have an account?")),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenSignUp()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blueAccent),
                    )),
              )
            ],
          ),
        )));
  }

  void _signIn() async {
    setState(() {
      isSigningIn = true;
    });

    String email = _email.text;
    String password = _password.text;

    User? user = await _auth.signIn(email, password);

    setState(() {
      isSigningIn = false;
    });

    if (user != null) {
      if (!user.emailVerified) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Verify Email"),
                content: const Text("Please verify your email to login"),
                actions: [
                  TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: const Text("OK"))
                ],
              );
            });
        return;
      } else {
        MyApp.of(context).setLoginStatus(true);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ScreenHome()));
      }
    }
  }
}
