// Feature 4: User and Admin Management
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speaksigns/homepage.dart';
import 'package:speaksigns/privacypolicy.dart';
import 'package:speaksigns/quiz%20&%20lesson%20screen.dart';
import 'package:speaksigns/terms&conditions.dart';
import 'package:speaksigns/usermanagement.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfileState();
}

class _ProfileState extends State<Profilescreen> {
  String userName = "Loading..."; // Default text before fetching username

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  // Function to get the username from FirebaseAuth
  void _loadUsername() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userName = user?.displayName ?? "Unknown User";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 166,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Text(
                    'SPEAK SIGN',
                    style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),

            SizedBox(height: 25), // Spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => homescreen()));
                  },
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                  title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.home, color: Colors.purple.shade800),
                ),
              ),
            ),

            SizedBox(height: 20),
            // Start Learning Block
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade100, // Purple background
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LessonsScreen()));
                  },
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                  title: Text('Start Learning', style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.menu_book, color: Colors.purple.shade800),
                ),
              ),
            ),

            SizedBox(height: 20), // Spacing

            // Privacy Policy Block
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => privacyscreen()));
                  },
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                  title: Text('Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.privacy_tip, color: Colors.purple.shade800),
                ),
              ),
            ),

            SizedBox(height: 20), // Spacing

            // Terms & Conditions Block
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()));
                  },
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                  title: Text('Terms and Conditions', style: TextStyle(fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.terminal_sharp, color: Colors.purple.shade800),
                ),
              ),
            ),

            SizedBox(height: 35), // Spacing

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserManagementScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Button color
                foregroundColor: Colors.white,  // Text color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Bigger size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Optional: rounded corners
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Optional: bold text
              ),
              child: Text('Go To Admin Page'),
            ),


            SizedBox(height: 25), // Final spacing
          ],
        ),
      ),
    );
  }
}
