import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/Email%20authentication/Firebase%20implementation/firebase%20auth%20services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home page.dart';

class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuthService _auth=FirebaseAuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signin"),),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: emailController,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "email"),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passController,
                decoration: InputDecoration(border: OutlineInputBorder(),hintText: "password"),),
            ),
            ElevatedButton(onPressed: _signIn, child: Text("Login"))
          ],
        ),
      ),
    );

  }
  void _signIn() async {

    String email = emailController.text;
    String password = passController.text;
    User? user = await _auth.signInWithEmailandPassword(email, password);

    if (user != null) {
      print("User created succesfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print("Some error occured");
    }
  }
}