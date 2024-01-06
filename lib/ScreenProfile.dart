import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_project/Account.dart';
import 'package:software_project/ScreenLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project/Transaction.dart';
import 'package:software_project/global/Common/toast.dart';

import 'main.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

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
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 35,
            ),
            title: const Text(
              'My Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Account()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.currency_rupee_rounded,
              size: 35,
            ),
            title: const Text(
              'Transaction History',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Transaction()));
            },
          ),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                signout(context);
                showToast(message: "Logout successfull");
              },
              child: const Text("Logout"))
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
