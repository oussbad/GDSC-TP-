// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gdsc/offline/Note/NotesPage.dart';

import '../Note/NotesScreen.dart';
import 'SignIn.dart';


class SignUp extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();





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
                      controller: fullNameController,
                      decoration: InputDecoration(
                        hintText: "Username",
                        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
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
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email id",
                        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
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
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
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
                        fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
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
                        signUp(
                          emailController.text,
                          passwordController.text,
                          fullNameController.text,
                          context
                        );
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
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


  void signUp(String email, String password, String fullName,BuildContext context) async {

    try {
       final auth =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ).then((value) => {
        value.user?.sendEmailVerification(),
        postDetailsToFirestore(email, fullName, context)
      })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


  void postDetailsToFirestore(String email, String fullName,BuildContext context) async {
    // calling our firestore
    // calling our user model
    // sedning these values


    User? user = FirebaseAuth.instance.currentUser;



    Map<String, dynamic> userData = {
      'fullName': fullName,
      'email': email, // Replace with the user's email

    };

    FirebaseFirestore.instance.collection('users').doc(user?.uid).set(userData)
        .then((value) {
      print('User data uploaded successfully!');
    }).catchError((error) {
      print('Error uploading user data: $error');
    });


    Fluttertoast.showToast(msg: "Account created successfully :) ");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NotesPage()));

    /*Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);*/
  }

}