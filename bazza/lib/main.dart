
import 'package:flutter/material.dart';

import 'widgets/home_screen.dart';
import 'widgets/lets_start.dart';
import 'widgets/login_screen.dart';
import 'widgets/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bazza',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(_)=>const SplasScreen(),
        '/login':(_)=> const Login(),
        '/letsStart':(_)=>const LetsStart(),
        '/homescreen':(_) => const HomeScreen(),
      },
    );
  }
}
