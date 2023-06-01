import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/buttons.dart';
import '../../common_widgets/textfield.dart';
import '../../utils/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  // final _passwordRegex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^\w\s]).{7,}$');

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
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0))),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.headlineSmall,
                    // style: TextStyle(
                    //     color: sosWhite,
                    //     fontSize: 26,
                    //     fontWeight: FontWeight.bold),
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
                          color: primaryColor,
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
                          color: primaryColor,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          } else if (_passwordController.text.length < 8) {
                            return "Password length should be atleast 8 characters";
                            // }else if (!_passwordRegex.hasMatch(value)) {
                            //   return 'Password should Contain at least one uppercase \none numeric value and one special character';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      authButton(
                        height: 50,
                        width: 340,
                        text: 'REGISTER',
                        textColor: sosWhite,
                        backgroundColor: primaryColor,
                        onPressed: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {
                                print('Account created successfully');
                            if (_formfield.currentState!.validate()) {
                              _usernameController.text.trim();
                              _phoneController.text.trim();
                              _emailController.text.trim();
                              _passwordController.text.trim();
                              Navigator.of(context).pushNamed('/login');
                            }
                          }).onError((error, stackTrace) {
                            print("Error  ${error.toString()}");
                          });
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
                                    fontSize: 16, color: primaryColor),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed('/login');
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
