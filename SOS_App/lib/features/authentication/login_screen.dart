import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/buttons.dart';
import '../../common_widgets/textfield.dart';
import '../../utils/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final TextEditingController _passwordTextController = TextEditingController();
  // final TextEditingController _emailTextController = TextEditingController();
  final _formfield = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

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
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: sosWhite,
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
                  key: _formfield,
                  child: Column(
                    children: [
                      reusableTextField(
                        controller: _emailController,
                        labelText: 'Enter Email',
                        hintText: 'Enter Email',
                        isPaswordType: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: primaryColor,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        hintText: 'Password',
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        isPaswordType: _obscureText,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: primaryColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      authButton(
                        height: 50,
                        width: 340,
                        text: 'LOGIN',
                        textColor: sosWhite,
                        backgroundColor: primaryColor,
                        onPressed: () {
                          if (_formfield.currentState!.validate()) {
                            _emailController.text.trim();
                            _passwordController.text.trim();
                            Navigator.of(context).pushNamed('/homescreen');
                          }
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Don't Have An Account?",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[850]),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Register Now ",
                                style: const TextStyle(
                                    fontSize: 16, color: primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed('/');
                                  }),
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
