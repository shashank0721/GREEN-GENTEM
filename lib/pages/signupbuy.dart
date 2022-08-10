import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:gg_1/pages/login_page.dart';

import 'package:gg_1/pages/utils/routes.dart';
import 'dart:core';

class RealSignUpPageBuy extends StatefulWidget {
  const RealSignUpPageBuy({Key? key}) : super(key: key);

  @override
  State<RealSignUpPageBuy> createState() => _RealSignUpPageBuyState();
}

class _RealSignUpPageBuyState extends State<RealSignUpPageBuy> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();

  final TextEditingController companyAddressEditingController =
      TextEditingController();
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  final TextEditingController countryEditingController =
      TextEditingController();

  final TextEditingController passwordEditingController =
      TextEditingController();
  final _auth = FirebaseAuth.instance;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
    }
  }

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 234, 244, 230),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: const Color.fromARGB(255, 234, 244, 230),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 200),
          child: Form(
            key: _formKey,
            child: SafeArea(
                child: Column(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/logo3.png",
                  height: 100,
                  width: 100,
                  alignment: Alignment.topRight,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 40,
                ),
                const Text("Sign Up",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Fill in your details",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        // ignore: prefer_const_constructors
                        controller: companyNameController,
                        decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.account_circle_rounded),
                            labelText: "Username",
                            hintText: "Enter your username"),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Compulsory";
                          }
                          return null;
                        },
                      ),
                      // const SizedBox(height: 32),
                      // TextFormField(
                      //   controller: companyOwnerEditingController,
                      //   decoration: const InputDecoration(
                      //       prefixIcon: const Icon(Icons.man),
                      //       labelText: "Company owner",
                      //       hintText: "Enter the company owner"),
                      //   validator: (value) {
                      //     if (value?.isEmpty ?? true) {
                      //       return "Compulsory";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: companyAddressEditingController,
                        decoration: const InputDecoration(
                            prefixIcon: const Icon(Icons.book),
                            labelText: "User Address",
                            hintText: "Enter your address"),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Compulsory";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: phoneNumberEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Phone number",
                            hintText: "Enter the phone number"),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Compulsory";
                          } else if (value?.length != 10) {
                            return "Enter valid phone number";
                          }
                        return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailEditingController,
                        decoration: const InputDecoration(
                            prefixIcon: const Icon(Icons.account_circle_sharp),
                            labelText: "Email ID",
                            hintText: "Enter the Email ID"),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Compulsory";
                          }
                          return null;
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
                            } else if (value!.length < 6) {
                              return "Password length should be atleast 6";
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
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: countryEditingController,
                        //initialValue: 'India',
                        decoration: const InputDecoration(
                            prefixIcon: const Icon(Icons.location_city),
                            labelText: "Country",
                            hintText: "Enter your country"),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "Compulsory";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      const Text(" Welcome to Green Gentem ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 8, 73, 18),
                      side: const BorderSide(
                          width: 3,
                          color: const Color.fromARGB(255, 8, 73, 18)),
                      elevation: 30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150, vertical: 15)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: emailEditingController.text,
                                password: passwordEditingController.text);
                      } on FirebaseAuthException catch (e) {
                        bool isValidEmail = EmailValidator.validate(
                            emailEditingController.text);

                        if (phoneNumberEditingController.text.length != 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter Valid Email-id")));
                        }

                        if (isValidEmail) {
                          print("Valid");
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Enter Valid Email-id")));
                        }

                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                          return;
                        }
                      } catch (e) {
                        print(e);
                        return;
                      }

                      var collection =
                          FirebaseFirestore.instance.collection('users');
                      collection
                          .doc(emailEditingController.text) // <-- Document ID
                          .set({
                            'email': emailEditingController.text,
                            'isLicenseUploaded': true,
                            'role': 0,
                            'username': companyNameController.text,
                            'user address':
                                companyAddressEditingController.text,
                            'phone number': phoneNumberEditingController.text,
                            'country': countryEditingController.text,
                            'isform': false,
                            'isUploadPressed': false,
                          }) // <-- Your data
                          .then((_) => print('Added'))
                          .catchError((error) => print('Add failed: $error'));
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  },
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            )),
          ),
        ));
  }
}