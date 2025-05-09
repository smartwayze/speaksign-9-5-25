import 'package:flutter/material.dart';
import 'package:speaksigns/login%20page.dart';
import 'package:speaksigns/signup%20screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          SizedBox(height: 22),

          // Image Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Image.asset(
              'assets/images/Speaksigns loginpic.png',
              height: 410,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          // White Background Section with Rounded Top Edges
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30)), // Rounded top
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Welcome Text
                  SizedBox(height: 20),
                  Text(
                    'WELCOME TO SPEAKSIGN',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  // Description
                  Text(
                    'SpeakSign is designed to break communication barriers for the deaf community. Our platform leverages an intuitive Learning Management System (LMS) to provide interactive and engaging sign language education. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Buttons for Login and Sign-up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: EdgeInsets.symmetric(
                              horizontal: 48, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 20), // Space between buttons

                      // Sign-up Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.purple,
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 43, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.purple),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Space at Bottom with Orange Background
          SizedBox(
              height:
                  20), // This makes the orange background visible at the bottom
        ],
      ),
    );
  }
}
