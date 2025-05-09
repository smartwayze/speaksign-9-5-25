import 'package:flutter/material.dart';

class TextToSignScreen extends StatefulWidget {
  @override
  _TextToSignScreenState createState() => _TextToSignScreenState();
}

class _TextToSignScreenState extends State<TextToSignScreen> {
  String inputText = "";
  String signOutput = "No sign conversion yet.";
  String signImage = ''; // Variable to hold image path or URL

  // Mapping text to images (replace these with actual images)
  Map<String, String> signLanguageImages = {
    "hello": 'assets/images/hello-in-sign-language.jpg',
    "hi": 'assets/images/hello-in-sign-language.jpg',
    "thank you": 'assets/images/thank-you-in-sign-language.jpg',
    "please": 'assets/images/please-in-sign-language.jpg',
    "i love you": 'assets/images/i-love-you-in-sign-language.jpg',
    "yes": 'assets/images/yes.jpg',
    "no": 'assets/images/nojpg.jpg',
    "good morning": 'assets/images/good morning.jpg',
    "good night": 'assets/images/good nightjpg.jpg',
    "how are you": 'assets/images/how-are-you-in-sign-language.jpg',
    "what is your name": 'assets/images/what is your namejpg.jpg',
    "sorry": 'assets/images/sorryjpg.jpg',
    "excuse me": 'assets/images/excuse-me-in-sign-language.jpg',
    "help": 'assets/images/helpjpg.jpg',
    "love you": 'assets/images/i-love-you-in-sign-language.jpg',
    "love": 'assets/images/i-love-you-in-sign-language.jpg',
    "friend": 'assets/images/friend.jpeg',
    "food": 'assets/images/food-in-sign-language.jpg',
    "nice to meet you": 'assets/images/nice to meet u1.jpg',
    "where is bathroom": 'assets/images/where is bathroom.jpg',
    "where is washroom": 'assets/images/where is bathroom.jpg',
    "i love learning": 'assets/images/i love learning.jpg',

    // Numbers
    "1": 'assets/images/number01.jpg',
    "2": 'assets/images/number02.jpg',
    "3": 'assets/images/number03.jpg',
    "4": 'assets/images/number4.jpg',
    "5": 'assets/images/number5jpg.jpg',
    "6": 'assets/images/number06.jpg',
    "7": 'assets/images/number07.jpg',
    "8": 'assets/images/number08.jpg',
    "9": 'assets/images/number09.jpg',

    // Alphabets
    "a": "assets/images/a.jpeg",
    "b": "assets/images/b.jpg",
    "c": "assets/images/c.jpeg",
    "d": "assets/images/d.jpeg",
    "e": "assets/images/e.jpeg",
    "f": "assets/images/f.jpeg",
    "g": "assets/images/g.jpeg",
    "h": "assets/images/h.jpeg",
    "i": "assets/images/i.jpeg",
    "j": "assets/images/j.jpeg",
    "k": "assets/images/k.jpeg",
    "l": "assets/images/l.jpeg",
    "m": "assets/images/m.jpeg",
    "n": "assets/images/n.jpeg",
    "o": "assets/images/o.jpeg",
    "p": "assets/images/p.jpeg",
    "q": "assets/images/q.jpeg",
    "r": "assets/images/r.jpeg",
    "s": "assets/images/s.jpeg",
    "t": "assets/images/t.jpeg",
    "u": "assets/images/u.jpeg",
    "v": "assets/images/v.jpeg",
    "w": "assets/images/w.jpeg",
    "x": "assets/images/x.jpeg",
    "y": "assets/images/y.jpeg",
    "z": "assets/images/z.jpeg",

    // Common words
    "brother": "assets/images/brother.jpeg",
    "sister": "assets/images/sister.jpeg",
    "mom": "assets/images/mom.jpeg",
    "dad": "assets/images/dad.jpeg",
    "mother": "assets/images/mom.jpeg",
    "father": "assets/images/dad.jpeg",
    "neighbour": "assets/images/friend.jpeg",
    "frustrated": "assets/images/frustrated.jpeg",
    "hungry": "assets/images/i am hungry.jpeg",
    "speak": "assets/images/speak.jpeg",
    "turn off": "assets/images/turn off.jpeg",
    "turn on": "assets/images/turnon.jpeg",
    "watch": "assets/images/watch.jpeg",
    "you are from": "assets/images/you are from.jpeg",
  };

  void convertTextToSign() {
    setState(() {
      String trimmedInput = inputText.trim().toLowerCase(); // Trim spaces and normalize case

      if (signLanguageImages.containsKey(trimmedInput)) {
        signOutput = "Sign representation of: $inputText";
        signImage = signLanguageImages[trimmedInput]!;
      } else {
        signOutput = "No sign representation available for: $inputText";
        signImage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Set AppBar height
        child: AppBar(
          backgroundColor: Colors.purple.shade700,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          iconTheme: IconThemeData(color: Colors.white), // Back arrow color
          title: Padding(
            padding: EdgeInsets.only(top: 10), // Adjusted space before title
            child: Text(
              'Text-to-Sign Conversion',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40), // Extra space at the top
              TextField(
                onChanged: (value) => inputText = value,
                decoration: InputDecoration(
                  labelText: 'Enter text',
                  labelStyle: TextStyle(color: Colors.purple.shade900),
                  filled: true,
                  fillColor: Colors.purple.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.purple.shade500, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.purple.shade700, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: convertTextToSign,
                child: Text('Convert Text to Sign'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple.shade700,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                signOutput,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple.shade900),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              signImage.isNotEmpty
                  ? Image.asset(
                signImage,
                height: 290,
                width: 300,
                fit: BoxFit.fill,
              )
                  : Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple.shade400, width: 2),
                ),
                child: Center(
                  child: Text(
                    "No sign available.",
                    style: TextStyle(fontSize: 16, color: Colors.purple.shade900),
                  ),
                ),
              ),
              SizedBox(height: 40), // Added bottom spacing for better UI
            ],
          ),
        ),
      ),
    );
  }
}
