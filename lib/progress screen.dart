import 'package:flutter/material.dart';

class ResetProgressScreen extends StatefulWidget {
  @override
  _ResetProgressScreenState createState() => _ResetProgressScreenState();
}

class _ResetProgressScreenState extends State<ResetProgressScreen> {
  List<Map<String, dynamic>> quizHistory = [
    {'date': '2025-02-15', 'score': '8/10'},
    {'date': '2025-02-14', 'score': '7/10'},
    {'date': '2025-02-13', 'score': '9/10'},
  ];

  void _resetProgress() {
    setState(() {
      quizHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Increased height
        child: AppBar(
          backgroundColor: Colors.purple, // Purple AppBar
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30), // Bottom radius
            ),
          ),
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back, color: Colors.white), // White back icon
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 10), // Added space before title
            child: Text(
              'Reset Screen',
              style: TextStyle(color: Colors.white), // White title text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
                'assets/images/WhatsApp Image 2025-02-17 at 12.10.11 AM.jpeg'),
            Expanded(
              child: quizHistory.isEmpty
                  ? Center(
                      child: Text(
                        'No quiz history available.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: quizHistory.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                                'Quiz Date: ${quizHistory[index]['date']}'),
                            subtitle:
                                Text('Score: ${quizHistory[index]['score']}'),
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Reset Progress'),
                    content: Text(
                        'Are you sure you want to reset your quiz history?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          _resetProgress();
                          Navigator.pop(context);
                        },
                        child: Text('Reset',
                            style: TextStyle(color: Colors.purple)),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text('Reset Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
