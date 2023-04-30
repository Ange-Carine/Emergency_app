import 'package:flutter/material.dart';

import 'home.dart';
import 'features/authentication/login_screen.dart';
import 'features/authentication/signup_screen.dart';

void main() {
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
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
       routes: {
        '/':(context) => const SignupScreen(),
        '/login':(context) => const LoginScreen(),
        '/homescreen':(context) => const HomeScreen(),
      },
    );
  }
}


