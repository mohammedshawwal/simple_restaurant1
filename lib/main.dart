import 'package:flutter/material.dart';
import 'package:eng_heba_project/sign_in.dart';


void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yumi Resto',
        home: Scaffold(
            body:SignInScreen()
        ));
  }
}
