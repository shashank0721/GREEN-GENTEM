import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailEditingController = TextEditingController();

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
              child: SafeArea(
                  child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Reset Password",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'DM Sans',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 32)),
              Column(
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
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailEditingController.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Check your email"),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(bottom: 100.0),
                      ));
                      Navigator.of(context).pop();
                    },
                    child: Text("Reset Password"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 8, 73, 18)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                  )
                ],
              )
            ],
          ))),
        ));
  }
}