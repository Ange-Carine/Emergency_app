import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Common_widgets/buttons.dart';
import 'Common_widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xffD31919),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 120),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Color(0xfffefefe),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      reusableTextField(
                        controller: _emailTextController,
                        labelText: 'Enter Email',
                        hintText: 'Enter Email',
                        isPaswordType: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xffD31919),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                        controller: _passwordTextController,
                        labelText: 'Password',
                        hintText: 'Password',
                        isPaswordType: true,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Color(0xffD31919),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      authButton(
                        height: 50,
                        width: 340,
                        text: 'LOGIN',
                        textColor: const Color(0xfffefefe),
                        backgroundColor: const Color(0xffD31919),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Don't Have An Account?",
                          style: TextStyle(fontSize: 16, color: Colors.grey[850]),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Register Now ",
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xffD31919)),
                                recognizer: TapGestureRecognizer()
                                ..onTap =() {
                                  Navigator.of(context).pushNamed('/register');
                                }
                                    
                            ),
                          ],
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
