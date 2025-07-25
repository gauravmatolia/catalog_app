import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
          Text("Welcome User",
          style: TextStyle(
            color: const Color.fromARGB(255, 36, 20, 84),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Password",
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              print("You have logged in!!")
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 88, 83, 200)
          ),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white
            ),),

          ),
        ],
      ),
    );
  }
}