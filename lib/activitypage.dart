import 'package:flutter/material.dart';
import 'package:speaksigns/text%20to%20sign%20page.dart';
import 'package:speaksigns/quiz%20&%20lesson%20screen.dart';
import 'package:speaksigns/sign%20to%20text%20page.dart';
import 'package:speaksigns/usermanagementscreen.dart';
import 'profilescreen.dart';
import 'package:speaksigns/video_lectures.dart';

class activityscreen extends StatelessWidget {
  const activityscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.purple.shade700,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Center(
                child: Text(
                  "Activity Screen",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.purple, width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.purple, width: 2),
                ),
                height: 230,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'You are not silent; your voice is in your hands. With every sign you make, you inspire, communicate, and break barriers.\n\nStart signing. Start speaking. Start making an impact!',
                    style: TextStyle(fontSize: 19, color: Colors.purple.shade800),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: GridView.count(
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
          ),
        ],
      ),
    );
  }
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
      Text(label, style: TextStyle(fontSize: 15)),
    ],
  );
}
