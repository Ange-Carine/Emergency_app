import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Common_widgets/buttons.dart';
import 'Common_widgets/textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  
  final _formfield = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
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
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xffD31919),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0))),
                child: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
                  child: const Text(
                    'Register',
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
                  key: _formfield,
                  child: Column(
                    children: [
                      reusableTextField(
                        controller: _usernameController,
                        labelText: 'Full Name',
                        hintText: 'Full Name',
                        isPaswordType: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xffD31919),
                        ),
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                        controller: _phoneController,
                        labelText: 'Phone',
                        hintText: 'Phone',
                        isPaswordType: false,
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color(0xffD31919),
                        ),
                        validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'Email',
                        isPaswordType: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xffD31919),
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
                        isPaswordType: _obscureText,
                        prefixIcon: const Icon(
                          Icons.key,
                          color: Color(0xffD31919),
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
                        text: 'REGISTER',
                        textColor: const Color(0xfffefefe),
                        backgroundColor: const Color(0xffD31919),
                        onPressed: () {
                          
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Have An Account Already?",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[850]),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Login Now ",
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xffD31919)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed('/');
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
