import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speaksigns/signup%20screen.dart';
import 'main.dart'; // Ensure HomeScreen is defined here.

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool _obscurePassword = true; // Toggle password visibility

  login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      showDialogBox("Enter required fields");
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } on FirebaseAuthException catch (ex) {
        showDialogBox(ex.message ?? "An error occurred");
      }
    }
  }

  void showDialogBox(String text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top rounded purple container
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  "SpeakSigns",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    "Log in to your account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Welcome back! Please enter your details.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: passwordcontroller,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                          color: Colors.purple, // Changed icon color to purple
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      login(emailcontroller.text, passwordcontroller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?",
                          style: TextStyle(color: Colors.black)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text("Sign up",
                            style: TextStyle(color: Colors.purple)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}