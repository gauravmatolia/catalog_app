import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 176, 129, 234),
        )
      ),
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
      },
    );
  }
}