import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Email authentication/signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey:  "AIzaSyB5SZgra1bgggasixiFFrsvh6Ih_AX1TnY",
        appId: "1:441461519164:android:4dbfaf7bca5d9a89dce439",
        messagingSenderId: "",
        projectId: "fir-authentication-cd58b")
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: LoginPage()
    );
  }
}

