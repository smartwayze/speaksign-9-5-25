import 'package:flutter/material.dart';
import 'package:speaksigns/quiz%20&%20lesson%20screen.dart';
import 'package:speaksigns/sign%20to%20text%20page.dart';
import 'package:speaksigns/text%20to%20sign%20page.dart';
import 'package:speaksigns/usermanagementscreen.dart';
import 'package:speaksigns/video_lectures.dart';
import 'profilescreen.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // **Image at the Top**
                Container(
                  color: Colors.white, // White background section
                  padding: EdgeInsets.only(bottom: 10), // Small space under image
                  child: Center(
                    child: Image.asset(
                      "assets/images/Speaksigns loginpic.png", // Replace with your image path
                      height: 410,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Header Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/img1.jpeg"),
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SpeakSigns",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            " Ready to learn",
                            style: TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignToTextScreen()));
                        },
                        child: serviceItem(
                            context, Icons.text_fields, "Sign to Text")),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TextToSignScreen()));
                        },
                        child: serviceItem(
                            context, Icons.sign_language, "Text to Sign")),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LMSHomeScreen()));
                        },
                        child: serviceItem(
                            context, Icons.laptop_mac_sharp, "LMS")),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuizzesScreen()));
                        },
                        child: serviceItem(context, Icons.quiz, "Quiz")),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LessonsScreen()));
                        },
                        child: serviceItem(
                            context, Icons.book_rounded, "Lessons")),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoLecturesPage()));
                        },
                        child: serviceItem(context, Icons.play_lesson, "Video Lecture")),
                  ],
                ),

                SizedBox(height: 20),

                // Motivational Search Container
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.purple.shade300, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your voice is powerful, even in silence. Keep learning, keep signing, and make the world understand you!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),
                optionItem(Icons.star, "Welcome To The World Of Sign Language"),
                optionItem(Icons.menu_book, "Start your learning journey"),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget serviceItem(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple.shade100,
          child: Icon(icon, color: Colors.purple),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget optionItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(text),
      onTap: () {},
    );
  }
}
