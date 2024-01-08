import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_project/ScreenLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project/global/Common/toast.dart';

import 'main.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  late String _userName;
  late String _userEmail;
  late String _userPhoneNumber;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    setState(() {
      _loading = true;
    });
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();

      setState(() {
        _userName = userSnapshot['name'];
        _userEmail = userSnapshot['email'];
        _userPhoneNumber = userSnapshot['mobile'];
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://www.w3schools.com/howto/img_avatar.png'),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.topLeft,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10),
                child: Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: _loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(_userName, style: const TextStyle(fontSize: 17)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10),
                child: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: _loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(_userEmail, style: const TextStyle(fontSize: 17))),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10),
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: _loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(_userPhoneNumber,
                        style: const TextStyle(fontSize: 17)),
              ),
              const SizedBox(
                height: 20,
              )
            ]),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              signout(context);
              showToast(message: "Logout successfull");
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }

  signout(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    MyApp.of(context).setLoginStatus(false);
    MyApp.of(context).changeTheme(ThemeMode.light);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MyLoginPage()),
        (route) => false);
  }
}
