import 'package:flutter/material.dart';
import 'package:speaksigns/quiz%20&%20lesson%20screen.dart';
import 'package:speaksigns/quiz%20menu%20screen.dart';
import 'lessonscreen(main).dart';

class LMSHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "LMS",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.shade300,
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(Icons.school, size: 60, color: Colors.purple),
                  SizedBox(height: 10),
                  Text(
                    "LEARNING MANAGEMENT SYSTEM",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade800,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Learn and review efficiently",
                    style: TextStyle(color: Colors.purple[600]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade400,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Start Study", style: TextStyle(color: Colors.white)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LessonsScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade600,
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>quizselectionscreen()));
                            },
                            child: Text("Start Review", style: TextStyle(color: Colors.white))
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  buildListItem(context, "Vocabulary I", "Continue your learning journey.", Lesson1()),
                  buildListItem(context, "Vocabulary II", "Continue your learning journey.", Lesson2()),
                  buildListItem(context, "Vocabulary III", "Continue your learning journey.", Lesson3()),
                  buildListItem(context, "Vocabulary IV", "Continue your learning journey.", Lesson4()),
                  buildListItem(context, "Vocabulary V", "Continue your learning journey.", Lesson5()),
                  buildListItem(context, "Vocabulary VI", "Continue your learning journey.", Lesson6()),
                  buildListItem(context, "Quiz", "Test your knowledge", quizselectionscreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(BuildContext context, String title, String subtitle, Widget screen) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: ListTile(
        leading: Icon(
          Icons.menu_book_rounded,
          color: Colors.purple.shade600,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade700,
          ),
        ),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.purple.shade500)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.purple.shade400),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
      ),
    );
  }
}
