import 'package:flutter/material.dart';

import 'home.dart';
import 'authentication/login_screen.dart';
import 'authentication/signup_screen.dart';

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
        '/':(context) => const LoginScreen(),
        '/register':(context) => const SignupScreen(),
        '/homescreen':(context) => const HomeScreen(),
      },
    );
  }
}


