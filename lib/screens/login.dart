import 'package:catalog_app/utils/router.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool pressedLogin = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{

    if (_formkey.currentState!.validate()) {
      setState(() {
        pressedLogin = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushNamed(
      context, MyRoutes.homeRoute);
      setState(() {
        pressedLogin = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
              Text("Welcome $name",
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
                      validator:(value) {
                        if(value!.isEmpty){
                        return "Username cannot be empty";
                        }

                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
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
                      validator:(value) {
                        if(value!.isEmpty){
                        return "Password cannot be empty";
                        }
                        else if(value.length < 6){
                          return "Password should be at least 6 letters";
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                color: pressedLogin ? Colors.pink.shade300 : Colors.deepPurple,
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40,
                    width: 130,
                    // decoration: BoxDecoration(
                    // color: pressedLogin ? Colors.purpleAccent : Colors.deepPurple.shade300,
                    // ),
                    child: Center(
                      child: pressedLogin ? Icon(Icons.done, color: Colors.white,) : Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight:FontWeight.bold,
                          fontSize: 20,
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}