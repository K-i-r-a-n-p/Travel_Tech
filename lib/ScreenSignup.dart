// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_project/ScreenLogin.dart';
import 'package:software_project/fire_base_auth/fire_base_auth_services.dart';
import 'package:software_project/global/Common/toast.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  bool isSigningUp = false;
  bool _vb = true;
  int _count = 0;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "SignUp",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text("Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.blueAccent)),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                    hintText: "Full Name", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  controller: _password,
                  obscureText: _vb,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _count = _count + 1;
                            if (_count % 2 == 0) {
                              setState(() {
                                _vb = false;
                              });
                            } else {
                              setState(() {
                                _vb = true;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_red_eye)))),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _mobile,
                decoration: const InputDecoration(
                    hintText: "Mobile No.", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _email,
                decoration: const InputDecoration(
                    hintText: "Email", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    _signUp();
                  },
                  child: isSigningUp
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Sign Up")),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text("Already have an Account?")),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyLoginPage()));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.blueAccent),
                    )),
              )
            ],
          ),
        )));
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String email = _email.text;
    String password = _password.text;
    String name = _name.text;
    String mobile = _mobile.text;

    User? user = await _auth.signUp(name, mobile, email, password);
    user?.uid;

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      if (email.contains("@gmail.com")) {
        showToast(message: "SignUp Successfull");
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Verify Email"),
                content: const Text(
                    "A verification link has been sent to your email, please verify to login"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyLoginPage()));
                      },
                      child: const Text("OK"))
                ],
              );
            });
      } else {
        showToast(message: "enter valid email");
      }
      if (user.emailVerified) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyLoginPage()));
      } else {
        showToast(message: "Please verify your email to login");
      }
    }
  }
}
