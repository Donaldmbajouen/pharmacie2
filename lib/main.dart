import 'package:flutter/material.dart';
import 'package:flutter_projets/Login.dart';
import 'package:flutter_projets/home.dart';

import 'Navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Login() ,
    );
  }
}

