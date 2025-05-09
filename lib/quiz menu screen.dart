import 'package:flutter/material.dart';
import 'package:speaksigns/quizscreen(with%20solutions).dart';

class quizselectionscreen extends StatelessWidget {
  const quizselectionscreen({super.key});

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
            title: Text('Select A Quiz', style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Column(
          children: [
            Spacer(),
            buildQuizRow(context, "assets/images/quiz1.jpg", Quiz1(), "assets/images/quiz 2.jpg", Quiz2()),
            buildQuizRow(context, "assets/images/quiz 3.jpg", Quiz3(), "assets/images/quiz4.jpg", Quiz4()),
            buildQuizRow(context, "assets/images/quiz5.jpg", Quiz5(), "assets/images/quiz6.jpg", Quiz6()),
            Spacer(),
          ],
        ));
  }

  Widget buildQuizRow(BuildContext context, String img1, Widget quiz1, String img2, Widget quiz2) {
    return Row(
      children: [
        Spacer(),
        buildTappableContainer(context, img1, quiz1),
        Spacer(),
        buildTappableContainer(context, img2, quiz2),
        Spacer(),
      ],
    );
  }

  Widget buildTappableContainer(BuildContext context, String imagePath, Widget quiz) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => quiz));
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
