import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_project/ScreenSplash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:software_project/places/Allapuzha.dart';
import 'package:software_project/places/Munnar.dart';
import 'package:software_project/places/Thekkadi.dart';
import 'package:software_project/places/Wayanad.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDEwqolN2fGxUWRQQxZg0SwYOeprNe8NJI',
          appId: '1:256615071611:android:56e91e03176bbdac6847de',
          messagingSenderId: '',
          projectId: 'software-project-efbb0'));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeMode = prefs.getString('themeMode');
    if (savedThemeMode != null) {
      setState(() {
        _themeMode = ThemeMode.values[int.parse(savedThemeMode)];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel And Tourism',
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: const SplashScreen(),
      routes: {
        '/Munnar': (context) => const PlaceMunnar(),
        '/Thekkadi': (context) => const PlaceThekkadi(),
        '/Wayanad': (context) => const PlaceWayanad(),
        '/Allapuzha': (context) => const PlaceAllapuzha(),
      },
    );
  }

  void changeTheme(ThemeMode themeMode) async {
    setState(() {
      _themeMode = themeMode;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', _themeMode.index.toString());
  }

  void setLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }
}
