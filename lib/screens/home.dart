import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    int days = 30;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: Center(child: Text("Catalog App")),
        titleTextStyle: TextStyle(
          color: Colors.white
        ),
        ),
      body: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to Flutter- Day $days")),
        ),
      ),
      drawer: Drawer(),
    );
  }
}