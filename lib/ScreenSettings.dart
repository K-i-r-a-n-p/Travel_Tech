import 'package:flutter/material.dart';
import 'package:software_project/main.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Change Theme",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: IconButton(
                    onPressed: () {
                      _count = _count + 1;
                      if (_count % 2 == 0) {
                        MyApp.of(context).changeTheme(ThemeMode.light);
                      } else {
                        MyApp.of(context).changeTheme(ThemeMode.dark);
                      }
                    },
                    icon: const Icon(Icons.brightness_medium),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
