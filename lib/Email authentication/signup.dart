import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauth/Email%20authentication/Firebase%20implementation/firebase%20auth%20services.dart';
import 'package:firebaseauth/Email%20authentication/Home%20page.dart';
import 'package:firebaseauth/Email%20authentication/signin%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("signup"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "password"),
              ),
            ),
            ElevatedButton(onPressed: _signUp, child: Text("Login")),
            TextButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>SignIn()));
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passController.text;
    User? user = await _auth.signUpWithEmailandPassword(email, password);

    if (user != null) {
      print("User created succesfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print("Some error occured");
    }
  }
}
