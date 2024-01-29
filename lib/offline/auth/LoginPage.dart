import 'package:flutter/material.dart';

import '../Note/NotesPage.dart';
import 'SignUpScreen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Icon(
              Icons.location_on_sharp,
              size: 100,
              color: Colors.white,
            ),
            Text(
              "GO MAP",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 2),
            ),
            Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Please login with your information",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        "Email address",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.done),
                        ),
                        obscureText: false,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Password",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.done),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                              },
                              child: Text("SignUp"))
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NotesPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 5,
                          shadowColor: myColor,
                          minimumSize: const Size.fromHeight(60),
                        ),
                        child: const Text("LOGIN"),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Or Login with",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Tab(icon: Image.asset("assets/images/facebook.png")),
                                Tab(icon: Image.asset("assets/images/twitter.png")),
                                Tab(icon: Image.asset("assets/images/github.png")),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

          ]
          ),
        ),
      ),
    );
  }

}