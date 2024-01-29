
import 'package:flutter/material.dart';
import 'package:gdsc/offline/auth/LoginPage.dart';

import '../../online/Note/NotesScreen.dart';



class SignUpScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullName = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child:
        SingleChildScrollView(
          child: Column(
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text("Enter details to get started"),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    fillColor: Theme
                        .of(context)
                        .primaryColor
                        .withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email id",
                    fillColor: Theme
                        .of(context)
                        .primaryColor
                        .withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Theme
                        .of(context)
                        .primaryColor
                        .withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(Icons.password_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Retype Password",
                    fillColor: Theme
                        .of(context)
                        .primaryColor
                        .withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(Icons.password_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => NotesScreen()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 5,
                    shadowColor: Colors.purple,
                    minimumSize: const Size.fromHeight(60),
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                Text("Or SignUp with"),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Tab(icon: Image.asset("assets/images/facebook.png")),
                    Tab(icon: Image.asset("assets/images/twitter.png")),
                    Tab(icon: Image.asset("assets/images/github.png")),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Text("Login"))
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}