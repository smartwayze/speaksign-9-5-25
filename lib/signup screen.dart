import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:speaksigns/privacypolicy.dart';
import 'package:speaksigns/terms&conditions.dart';
import 'login page.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  void _signUp() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty) {
      _showDialog("Please fill email");
      return;
    }
    if (password.length < 6) {
      _showDialog("Password must be at least 6 characters.");
      return;
    }
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      _showDialog("Signup Successful!", success: true);
    } on FirebaseAuthException catch (e) {
      _showDialog(e.message ?? "An error occurred.");
    } catch (e) {
      _showDialog("An unexpected error occurred.");
    }
  }

  void _showDialog(String message, {bool success = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (success) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Text(
          "SpeakSigns",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Login / Signup", style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Sign up",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple)),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Enter your email ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "User@email.com",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Enter your password ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "******",
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Text(
                          "By signing up you agree to the SpeakSigns",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TermsAndConditionsScreen()));
                              },
                              child: Text(
                                "   Terms & Conditions",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.purple, fontSize: 18),
                              ),
                            ),
                            Text(
                              " and SpeakSigns",
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => privacyscreen()));
                          },
                          child: Text(
                            "  Privacy Policy",
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.purple, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",
                            style: TextStyle(color: Colors.black)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text("Log in here",
                              style: TextStyle(color: Colors.purple)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.purple),
                ),
                ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    minimumSize: Size(120, 50),
                  ),
                  child: Text("Sign up", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
