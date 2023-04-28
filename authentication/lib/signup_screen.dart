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
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

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
                height: 220,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xffD31919),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 90),
                  child: Text(
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
                  key: _formKey,
                  child: Column(
                    children: [
                      reusableTextField(
                        controller: _usernameTextController,
                        labelText: 'Full Name',
                        hintText: 'Full Name',
                        isPaswordType: false,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xffD31919),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                        controller: _phoneTextController,
                        labelText: 'Phone',
                        hintText: 'Phone',
                        isPaswordType: false,
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Color(0xffD31919),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField(
                        controller: _emailTextController,
                        labelText: 'Email',
                        hintText: 'Email',
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
                        text: 'REGISTER',
                        textColor: const Color(0xfffefefe),
                        backgroundColor: const Color(0xffD31919),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Have An Account Already?",
                          style: TextStyle(fontSize: 16, color: Colors.grey[850]),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Login Now ",
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xffD31919)),
                                recognizer: TapGestureRecognizer()
                                ..onTap =() {
                                  Navigator.of(context).pushNamed('/');
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