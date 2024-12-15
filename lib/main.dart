import 'package:flutter/material.dart';
import 'package:halal_fried_chicks/screens/aut_screens/login_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Halal Fried Chicks',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
