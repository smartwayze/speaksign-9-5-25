import 'package:flutter/material.dart';
import 'package:speaksigns/lessonscreen(main).dart';
import 'package:speaksigns/progress%20screen.dart';
import 'package:speaksigns/quiz%20menu%20screen.dart';

class LessonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Lessons', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          buildLessonRow(context, "assets/images/lesson1.jpg", Lesson1(), "assets/images/lesson 2.jpg", Lesson2()),
          buildLessonRow(context, "assets/images/lesson 3.jpg", Lesson3(), "assets/images/lesson 4.jpg", Lesson4()),
          buildLessonRow(context, "assets/images/lesson5.jpg", Lesson5(), "assets/images/lesson6.jpg", Lesson6()),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildLessonRow(BuildContext context, String img1, Widget lesson1, String img2, Widget lesson2) {
    return Row(
      children: [
        Spacer(),
        buildTappableContainer(context, img1, lesson1),
        Spacer(),
        buildTappableContainer(context, img2, lesson2),
        Spacer(),
      ],
    );
  }

  Widget buildTappableContainer(BuildContext context, String imagePath, Widget lesson) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => lesson));
        },
        borderRadius: BorderRadius.circular(25),
        splashColor: Colors.purple.shade400,
        child: Container(
          height: 135,
          width: 135,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(2, 4),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class QuizzesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Quizzes',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 60),
          Image.asset('assets/images/WhatsApp Image 2025-02-17 at 12.10.11 AM.jpeg'),
          SizedBox(height: 20),
          buildTappableButton(context, "Start Quiz", quizselectionscreen()),
          SizedBox(height: 20),
          buildTappableButton(context, "Reset Progress", ResetProgressScreen()),
        ],
      ),
    );
  }

  Widget buildTappableButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade600,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
          },
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.purple.shade400,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
