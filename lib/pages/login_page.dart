import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gg_1/pages/option.dart';


import 'package:gg_1/pages/registeras.dart';
import 'package:gg_1/pages/reset_password.dart';
import 'package:gg_1/pages/signupbuy.dart';

import 'package:gg_1/pages/utils/routes.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:core';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = " ";
  bool changeShape = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        changeShape = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeShape = false;
      });
    }
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromARGB(255, 234, 244, 230),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 234, 244, 230),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: const Color.fromARGB(255, 234, 244, 230),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/logo3.png",
                      height: 100,
                      width: 100,
                      alignment: Alignment.topRight,
                    ),
                    SizedBox(height: 40),
                    Text("Let's Sign You In",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                    SizedBox(height: 40),
                    Text("Welcome back , you've been missed!",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 32),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailEditingController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle_rounded),
                                hintText: "Enter Email",
                                labelText: "Email"),
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return "Username or Email cannot be empty";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                              setState(() {});
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextFormField(
                              controller: passwordEditingController,
                              obscureText: _isObscure,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return "Password cannot be empty";
                                }
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_person_rounded),
                                hintText: "Enter Password",
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                              )),
                          SizedBox(height: 8),
                          forgetPassword(context),
                          SizedBox(height: 10),
                          Material(
                            color: Color.fromARGB(255, 8, 73, 18),
                            borderRadius:
                                BorderRadius.circular(changeShape ? 50 : 50),
                            child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email:
                                                    emailEditingController.text,
                                                password:
                                                    passwordEditingController
                                                        .text);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Option()));
                                  } on FirebaseAuthException catch (e) {
                                    bool isValid = EmailValidator.validate(
                                        emailEditingController.text);

                                    if (isValid) {
                                      print("Valid");
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Enter Valid Email-id")));
                                    }
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Incorrect Email-id"),
                                      ));
                                    } else if (e.code == 'wrong-password') {
                                      print(
                                          'Wrong password provided for that user.');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Incorrect Password"),
                                      ));
                                    }
                                    return;
                                  };
                                  
                                  
                                }
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: changeShape ? 50 : 500,
                                height: 43,
                                alignment: Alignment.center,
                                child: changeShape
                                    ? Icon(Icons.done_all_sharp,
                                        color: Colors.white)
                                    : Text(
                                        "SIGN IN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Dont' have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => RealSignUpPageBuy())));
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassword())),
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.right,
          )),
    );
  }
}