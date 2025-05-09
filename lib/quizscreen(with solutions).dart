import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Quiz1 extends StatefulWidget {
  @override
  _Quiz1State createState() => _Quiz1State();
}

class _Quiz1State extends State<Quiz1> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the sign for "Hello"?',
      'options': ['Wave', 'Thumbs Up', 'Handshake', 'Pointing'],
      'answer': 'Wave',
    },
    {
      'question': 'Which handshape is used for "Thank You"?',
      'options': ['Flat Hand', 'Fist', 'V Shape', 'Open Palm'],
      'answer': 'Flat Hand',
    },
    {
      'question': 'What does the "V" sign represent in sign language?',
      'options': ['Victory', 'Peace', 'Love', 'Number Two'],
      'answer': 'Number Two',
    },
    {
      'question': 'What is the sign for "Goodbye"?',
      'options': ['Wave', 'Cross Arms', 'Salute', 'Fist'],
      'answer': 'Wave',
    },
    {
      'question': 'How do you sign "Yes" in ASL?',
      'options': ['Nod Fist', 'Thumbs Up', 'Open Palm', 'Clap'],
      'answer': 'Nod Fist',
    },
    {
      'question': 'Which of these is used for "Please"?',
      'options': ['Flat Hand on Chest', 'Pointing Finger', 'Fist Bump', 'Wave'],
      'answer': 'Flat Hand on Chest',
    },
    {
      'question': 'What is the sign for "I Love You"?',
      'options': ['ILY Handshape', 'Peace Sign', 'Thumbs Up', 'Fist'],
      'answer': 'ILY Handshape',
    },
    {
      'question': 'How do you sign "Sorry"?',
      'options': ['Fist Circling Chest', 'Thumbs Up', 'Open Palm', 'Clap'],
      'answer': 'Fist Circling Chest',
    },
    {
      'question': 'What is the sign for "Help"?',
      'options': ['Thumbs Up on Palm', 'Wave', 'Fist Pump', 'Crossed Arms'],
      'answer': 'Thumbs Up on Palm',
    },
    {
      'question': 'Which handshape is used for "Friend"?',
      'options': [
        'Linked Index Fingers',
        'High Five',
        'Fist Bump',
        'Open Hands'
      ],
      'answer': 'Linked Index Fingers',
    },
  ];

  Map<int, String> _selectedAnswers = {};
  int _score = 0;
  bool _submitted = false;

  void _submitQuiz() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (_questions[index]['answer'] == answer) {
        score++;
      }
    });
    setState(() {
      _score = score;
      _submitted = true;
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pop(context);
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
              'Start Quiz 1',
              style: TextStyle(color: Colors.white), // White title text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${_questions[index]['question']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ..._questions[index]['options'].map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _selectedAnswers[index],
                              onChanged: _submitted
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value!;
                                      });
                                    },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitted ? null : _submitQuiz,
              child: Text('Submit'),
            ),
            if (_submitted)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Score: $_score / ${_questions.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Quiz2 extends StatefulWidget {
  @override
  _Quiz2State createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the sign for "Water"?',
      'options': ['W on Chin', 'Thumbs Up', 'Fist Pump', 'Open Palm'],
      'answer': 'W on Chin',
    },
    {
      'question': 'How do you sign "Eat"?',
      'options': ['Hand to Mouth', 'Open Palm', 'Fist Pump', 'Thumbs Up'],
      'answer': 'Hand to Mouth',
    },
    {
      'question': 'What is the sign for "Mother"?',
      'options': ['Open Hand on Chin', 'Fist Pump', 'High Five', 'V Shape'],
      'answer': 'Open Hand on Chin',
    },
    {
      'question': 'What is the sign for "Father"?',
      'options': ['Open Hand on Forehead', 'Wave', 'Thumbs Up', 'Nod Fist'],
      'answer': 'Open Hand on Forehead',
    },
    {
      'question': 'How do you sign "School"?',
      'options': ['Clapping Hands', 'Fist Pump', 'Thumbs Up', 'Open Palm'],
      'answer': 'Clapping Hands',
    },
    {
      'question': 'What is the sign for "Home"?',
      'options': [
        'Hand from Chin to Ear',
        'Thumbs Up',
        'Open Palm',
        'High Five'
      ],
      'answer': 'Hand from Chin to Ear',
    },
    {
      'question': 'How do you sign "Work"?',
      'options': ['Fists Together', 'Peace Sign', 'Open Hand', 'Wave'],
      'answer': 'Fists Together',
    },
    {
      'question': 'What is the sign for "Night"?',
      'options': ['Flat Hand Over Fist', 'Thumbs Up', 'Wave', 'High Five'],
      'answer': 'Flat Hand Over Fist',
    },
    {
      'question': 'How do you sign "Day"?',
      'options': ['Arm Moving Like Sun', 'Thumbs Up', 'Clap', 'Wave'],
      'answer': 'Arm Moving Like Sun',
    },
    {
      'question': 'What is the sign for "Car"?',
      'options': [
        'Hands Like Steering Wheel',
        'Wave',
        'Peace Sign',
        'Nod Fist'
      ],
      'answer': 'Hands Like Steering Wheel',
    },
  ];

  Map<int, String> _selectedAnswers = {};
  int _score = 0;
  bool _submitted = false;

  void _submitQuiz() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (_questions[index]['answer'] == answer) {
        score++;
      }
    });
    setState(() {
      _score = score;
      _submitted = true;
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pop(context);
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
              'Start Quiz 2',
              style: TextStyle(color: Colors.white), // White title text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${_questions[index]['question']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ..._questions[index]['options'].map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _selectedAnswers[index],
                              onChanged: _submitted
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value!;
                                      });
                                    },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitted ? null : _submitQuiz,
              child: Text('Submit'),
            ),
            if (_submitted)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Score: $_score / ${_questions.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Quiz3 extends StatefulWidget {
  @override
  _Quiz3State createState() => _Quiz3State();
}

class _Quiz3State extends State<Quiz3> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How do you sign "Store"?',
      'options': [
        'Flat Hands Moving Out',
        'Thumbs Up',
        'Open Palm',
        'Fist Pump'
      ],
      'answer': 'Flat Hands Moving Out',
    },
    {
      'question': 'What is the sign for "Baby"?',
      'options': ['Rocking Arms', 'Thumbs Up', 'Clap', 'High Five'],
      'answer': 'Rocking Arms',
    },
    {
      'question': 'How do you sign "Thank You"?',
      'options': ['Flat Hand from Chin', 'Thumbs Up', 'Fist Pump', 'Open Palm'],
      'answer': 'Flat Hand from Chin',
    },
    {
      'question': 'What is the sign for "Music"?',
      'options': [
        'Wave Like Conducting',
        'Thumbs Up',
        'Peace Sign',
        'High Five'
      ],
      'answer': 'Wave Like Conducting',
    },
    {
      'question': 'What is the sign for "Dog"?',
      'options': ['Snap Fingers', 'Pat Leg', 'Clap', 'Thumbs Up'],
      'answer': 'Snap Fingers',
    },
    {
      'question': 'How do you sign "Cat"?',
      'options': ['Pinched Fingers at Cheek', 'Wave', 'Thumbs Up', 'Open Palm'],
      'answer': 'Pinched Fingers at Cheek',
    },
    {
      'question': 'What is the sign for "House"?',
      'options': ['Roof Shape with Hands', 'Thumbs Up', 'Open Palm', 'Clap'],
      'answer': 'Roof Shape with Hands',
    },
    {
      'question': 'How do you sign "Tree"?',
      'options': ['One Arm Up', 'Cross Arms', 'Clap', 'High Five'],
      'answer': 'One Arm Up',
    },
    {
      'question': 'What is the sign for "Book"?',
      'options': ['Open and Close Hands', 'Thumbs Up', 'Clap', 'Open Palm'],
      'answer': 'Open and Close Hands',
    },
    {
      'question': 'Which handshape is used for "Doctor"?',
      'options': ['D on Wrist', 'Flat Hand', 'Thumbs Up', 'Pointing Finger'],
      'answer': 'D on Wrist',
    },
    {
      'question': 'What is the sign for "Nurse"?',
      'options': ['N on Wrist', 'High Five', 'Clap', 'Peace Sign'],
      'answer': 'N on Wrist',
    },
  ];

  Map<int, String> _selectedAnswers = {};
  int _score = 0;
  bool _submitted = false;

  void _submitQuiz() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (_questions[index]['answer'] == answer) {
        score++;
      }
    });
    setState(() {
      _score = score;
      _submitted = true;
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pop(context);
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
              'Start Quiz 3',
              style: TextStyle(color: Colors.white), // White title text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${_questions[index]['question']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ..._questions[index]['options'].map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _selectedAnswers[index],
                              onChanged: _submitted
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value!;
                                      });
                                    },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitted ? null : _submitQuiz,
              child: Text('Submit'),
            ),
            if (_submitted)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Score: $_score / ${_questions.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Quiz4 extends StatefulWidget {
  @override
  _Quiz4State createState() => _Quiz4State();
}

class _Quiz4State extends State<Quiz4> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How do you sign "Time"?',
      'options': ['Tap Wrist', 'Thumbs Up', 'Fist', 'Wave'],
      'answer': 'Tap Wrist',
    },
    {
      'question': 'What is the sign for "Morning"?',
      'options': ['One Arm Rising', 'Wave', 'Thumbs Up', 'Clap'],
      'answer': 'One Arm Rising',
    },
    {
      'question': 'How do you sign "Night"?',
      'options': ['Flat Hand Over Fist', 'Clap', 'Open Palm', 'Wave'],
      'answer': 'Flat Hand Over Fist',
    },
    {
      'question': 'What is the sign for "Rain"?',
      'options': ['Wiggling Fingers Down', 'Clap', 'Thumbs Up', 'Fist'],
      'answer': 'Wiggling Fingers Down',
    },
    {
      'question': 'How do you sign "Snow"?',
      'options': ['Fingers Fluttering Down', 'Wave', 'Open Palm', 'Clap'],
      'answer': 'Fingers Fluttering Down',
    },
    {
      'question': 'What is the sign for "Sun"?',
      'options': ['Circle in Air', 'Thumbs Up', 'Clap', 'Wave'],
      'answer': 'Circle in Air',
    },
    {
      'question': 'How do you sign "Moon"?',
      'options': ['C Shape Near Eye', 'Open Palm', 'Clap', 'High Five'],
      'answer': 'C Shape Near Eye',
    },
    {
      'question': 'What is the sign for "Happy"?',
      'options': [
        'Flat Hands on Chest Moving Up',
        'Clap',
        'Open Palm',
        'Thumbs Up'
      ],
      'answer': 'Flat Hands on Chest Moving Up',
    },
    {
      'question': 'How do you sign "Sad"?',
      'options': ['Flat Hands Down Face', 'Thumbs Up', 'Wave', 'Clap'],
      'answer': 'Flat Hands Down Face',
    },
    {
      'question': 'What is the sign for "Angry"?',
      'options': ['Claw Hand to Face', 'Fist', 'Clap', 'High Five'],
      'answer': 'Claw Hand to Face',
    },
  ];

  Map<int, String> _selectedAnswers = {};
  int _score = 0;
  bool _submitted = false;

  void _submitQuiz() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (_questions[index]['answer'] == answer) {
        score++;
      }
    });
    setState(() {
      _score = score;
      _submitted = true;
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pop(context);
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
              'Start Quiz 4',
              style: TextStyle(color: Colors.white), // White title text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${_questions[index]['question']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ..._questions[index]['options'].map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _selectedAnswers[index],
                              onChanged: _submitted
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value!;
                                      });
                                    },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitted ? null : _submitQuiz,
              child: Text('Submit'),
            ),
            if (_submitted)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Score: $_score / ${_questions.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Quiz5 extends StatefulWidget {
  @override
  _Quiz5State createState() => _Quiz5State();
}

class _Quiz5State extends State<Quiz5> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How do you sign "Scared"?',
      'options': ['Hands Open to Chest', 'Wave', 'Thumbs Up', 'Clap'],
      'answer': 'Hands Open to Chest',
    },
    {
      'question': 'What is the sign for "Teacher"?',
      'options': ['Flat Hands from Forehead', 'Wave', 'Open Palm', 'Thumbs Up'],
      'answer': 'Flat Hands from Forehead',
    },
    {
      'question': 'How do you sign "Student"?',
      'options': ['Flat Hand to Head', 'Fist', 'Clap', 'Thumbs Up'],
      'answer': 'Flat Hand to Head',
    },
    {
      'question': 'What is the sign for "Learn"?',
      'options': ['Flat Hand to Forehead', 'Wave', 'Open Palm', 'Clap'],
      'answer': 'Flat Hand to Forehead',
    },
    {
      'question': 'How do you sign "Food"?',
      'options': ['Hand to Mouth', 'Thumbs Up', 'Open Palm', 'Clap'],
      'answer': 'Hand to Mouth',
    },
    {
      'question': 'What is the sign for "Drink"?',
      'options': ['C Shape to Mouth', 'Wave', 'Clap', 'Thumbs Up'],
      'answer': 'C Shape to Mouth',
    },
    {
      'question': 'How do you sign "Water"?',
      'options': ['W on Chin', 'Thumbs Up', 'Fist Pump', 'Open Palm'],
      'answer': 'W on Chin',
    },
    {
      'question': 'How do you sign "Eat"?',
      'options': ['Hand to Mouth', 'Open Palm', 'Fist Pump', 'Thumbs Up'],
      'answer': 'Hand to Mouth',
    },
    {
      'question': 'What is the sign for "Car"?',
      'options': [
        'Hands Like Steering Wheel',
        'Wave',
        'Peace Sign',
        'Nod Fist'
      ],
      'answer': 'Hands Like Steering Wheel',
    },
    {
      'question': 'How do you sign "Store"?',
      'options': [
        'Flat Hands Moving Out',
        'Thumbs Up',
        'Open Palm',
        'Fist Pump'
      ],
      'answer': 'Flat Hands Moving Out',
    },
    {
      'question': 'What is the sign for "Baby"?',
      'options': ['Rocking Arms', 'Thumbs Up', 'Clap', 'High Five'],
      'answer': 'Rocking Arms',
    },
    {
      'question': 'How do you sign "Thank You"?',
      'options': ['Flat Hand from Chin', 'Thumbs Up', 'Fist Pump', 'Open Palm'],
      'answer': 'Flat Hand from Chin',
    },
    {
      'question': 'What is the sign for "Music"?',
      'options': [
        'Wave Like Conducting',
        'Thumbs Up',
        'Peace Sign',
        'High Five'
      ],
      'answer': 'Wave Like Conducting',
    },
    {
      'question': 'What is the sign for "Music"?',
      'options': [
        'Wave Like Conducting',
        'Thumbs Up',
        'Peace Sign',
        'High Five'
      ],
      'answer': 'Wave Like Conducting',
    }
  ];

  Map<int, String> _selectedAnswers = {};
  int _score = 0;
  bool _submitted = false;

  void _submitQuiz() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (_questions[index]['answer'] == answer) {
        score++;
      }
    });
    setState(() {
      _score = score;
      _submitted = true;
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pop(context);
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
              'Start Quiz 5',
              style: TextStyle(color: Colors.white), // White title text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${_questions[index]['question']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ..._questions[index]['options'].map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _selectedAnswers[index],
                              onChanged: _submitted
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value!;
                                      });
                                    },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitted ? null : _submitQuiz,
              child: Text('Submit'),
            ),
            if (_submitted)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Score: $_score / ${_questions.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Quiz6 extends StatefulWidget {
  @override
  _Quiz6State createState() => _Quiz6State();
}

class _Quiz6State extends State<Quiz6> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How do you sign "Hello"?',
      'options': ['Hand Wave', 'Thumbs Up', 'Peace Sign', 'Open Palm'],
      'answer': 'Hand Wave',
    },
    {
      'question': 'What is the sign for "Goodbye"?',
      'options': ['Waving Hand', 'Flat Hand Forward', 'Thumbs Up', 'Clap'],
      'answer': 'Waving Hand',
    },
    {
      'question': 'How do you sign "Friend"?',
      'options': [
        'Interlocking Index Fingers',
        'High Five',
        'Thumbs Up',
        'Clap'
      ],
      'answer': 'Interlocking Index Fingers',
    },
    {
      'question': 'What is the sign for "Love"?',
      'options': ['Crossed Arms Over Chest', 'Wave', 'Thumbs Up', 'Fist Pump'],
      'answer': 'Crossed Arms Over Chest',
    },
    {
      'question': 'How do you sign "Yes"?',
      'options': ['Nodding Fist', 'Thumbs Up', 'Clap', 'Peace Sign'],
      'answer': 'Nodding Fist',
    },
    {
      'question': 'What is the sign for "No"?',
      'options': [
        'Pinched Fingers Moving Away',
        'Wave',
        'Thumbs Up',
        'High Five'
      ],
      'answer': 'Pinched Fingers Moving Away',
    },
    {
      'question': 'How do you sign "Please"?',
      'options': ['Flat Hand Circling Chest', 'Thumbs Up', 'Clap', 'Open Palm'],
      'answer': 'Flat Hand Circling Chest',
    },
    {
      'question': 'What is the sign for "Sorry"?',
      'options': ['Fist Circling Chest', 'Thumbs Up', 'Wave', 'Clap'],
      'answer': 'Fist Circling Chest',
    },
    {
      'question': 'How do you sign "Help"?',
      'options': ['Fist on Open Palm', 'Wave', 'Thumbs Up', 'Peace Sign'],
      'answer': 'Fist on Open Palm',
    },
    {
      'question': 'What is the sign for "School"?',
      'options': ['Clapping Hands Twice', 'Wave', 'Thumbs Up', 'Fist Pump'],
      'answer': 'Clapping Hands Twice',
    }
  ];

  Map<int, String> _selectedAnswers = {};
  int _score = 0;
  bool _submitted = false;

  void _submitQuiz() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (_questions[index]['answer'] == answer) {
        score++;
      }
    });
    setState(() {
      _score = score;
      _submitted = true;
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pop(context);
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
              'Start Quiz 6',
              style: TextStyle(color: Colors.white), // White title text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${_questions[index]['question']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ..._questions[index]['options'].map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _selectedAnswers[index],
                              onChanged: _submitted
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value!;
                                      });
                                    },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitted ? null : _submitQuiz,
              child: Text('Submit'),
            ),
            if (_submitted)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Your Score: $_score / ${_questions.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
