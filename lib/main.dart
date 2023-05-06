import 'package:flutter/material.dart';
import 'package:ltdd/modules/forgot_password.dart';
import 'package:ltdd/modules/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dev',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginView(),
        '/forgotPassword': (context) => ForgotPasswordView(),
      },
    );
  }
}
