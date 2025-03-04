import 'package:eticket_flutter_app/ui/auth/login_screen.dart';
import 'package:eticket_flutter_app/ui/auth/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        'login': (context) => LoginScreen(),
      },
    );
  }
}