import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/themes/theme.dart';
import 'features/location/current_location.dart';
import 'features/home_screen/home.dart';
import 'features/authentication/login/screens/login.dart';
import 'features/authentication/sign_up/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SOS Auth',
      theme: SOSTheme.lightTheme,
      darkTheme: SOSTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/homescreen': (context) => const HomeScreen(),
        '/location': (context) => const CurrrentLocation(),
      },
    );
  }
}
