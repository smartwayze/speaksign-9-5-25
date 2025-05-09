import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Lesson1 extends StatelessWidget {
  const Lesson1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> signs = [
      {
        'title': 'Hello',
        'description': 'Wave your hand to say Hello.',
        'image': 'assets/images/hello-in-sign-language.jpg',
      },
      {
        'title': 'Thank You',
        'description': 'Flat hand moves from chin outward.',
        'image': 'assets/images/thank-you-in-sign-language.jpg',
      },
      {
        'title': 'Please',
        'description': 'Flat hand circles on chest.',
        'image': 'assets/images/please-in-sign-language.jpg',
      },
      {
        'title': 'I Love You',
        'description': 'Thumb, index, and pinky extended.',
        'image': 'assets/images/i-love-you-in-sign-language.jpg',
      },
      {
        'title': 'Yes',
        'description': 'Fist moves up and down like nodding.',
        'image': 'assets/images/yes.jpg',
      },
      {
        'title': 'No',
        'description': 'Index and middle fingers tap thumb.',
        'image': 'assets/images/nojpg.jpg',
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Lesson 1: Basic Signs',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: signs.length,
          itemBuilder: (context, index) {
            final sign = signs[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        sign['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported, size: 80);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sign['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            sign['description']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



class Lesson2 extends StatelessWidget {
  const Lesson2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> phrases = [
      {
        'title': 'Good Morning',
        'description': 'Hand moves from chin outward while the other hand rises.',
        'image': 'assets/images/good morning.jpg',
      },
      {
        'title': 'Good Night',
        'description': 'One hand touches chin and then meets the other hand near the chest.',
        'image': 'assets/images/good night.jpg',
      },
      {
        'title': 'How are you?',
        'description': 'Both hands move outward from chest, then one points forward.',
        'image': 'assets/images/how-are-you-in-sign-language.jpg',
      },
      {
        'title': 'What is your name?',
        'description': 'Index fingers tap each other and then point to the person.',
        'image': 'assets/images/what is your namejpg.jpg',
      },
      {
        'title': 'Sorry',
        'description': 'Closed fist circles over the chest.',
        'image': 'assets/images/sorryjpg.jpg',
      },
      {
        'title': 'Excuse Me',
        'description': 'Hand brushes the other hand lightly.',
        'image': 'assets/images/excuse-me-in-sign-language.jpg',
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Lesson 2: Common Phrases',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: phrases.length,
          itemBuilder: (context, index) {
            final phrase = phrases[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        phrase['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported,
                              size: 80, color: Colors.grey);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            phrase['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            phrase['description']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class Lesson3 extends StatelessWidget {
  const Lesson3({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> vocabulary = [
      {
        'word': 'Thank You',
        'description': 'Hand moves outward from chin.',
        'image': 'assets/images/thank-you-in-sign-language.jpg',
      },
      {
        'word': 'Please',
        'description': 'Hand circles over chest in a circular motion.',
        'image': 'assets/images/please-in-sign-language.jpg',
      },
      {
        'word': 'Help',
        'description': 'One hand lifts the other palm-up with a thumbs-up.',
        'image': 'assets/images/helpjpg.jpg',
      },
      {
        'word': 'Love',
        'description': 'Both arms cross over chest.',
        'image': 'assets/images/i-love-you-in-sign-language.jpg',
      },
      {
        'word': 'Friend',
        'description': 'Index fingers hook together and rotate.',
        'image': 'assets/images/friendjpg.jpg',
      },
      {
        'word': 'Food',
        'description': 'Fingers touch the lips as if bringing food to mouth.',
        'image': 'assets/images/food-in-sign-language.jpg',
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Lesson 3: Essential Vocabulary',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: vocabulary.length,
          itemBuilder: (context, index) {
            final word = vocabulary[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        word['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported, size: 80);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            word['word']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            word['description']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Lesson4 extends StatelessWidget {
  const Lesson4({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sentences = [
      {
        'sentence': 'How are you?',
        'description': 'Move both hands outward with raised eyebrows.',
        'image': 'assets/images/how-are-you-in-sign-language.jpg',
      },
      {
        'sentence': 'What is your name?',
        'description': 'Tap fingers together then point.',
        'image': 'assets/images/what is your namejpg.jpg',
      },
      {
        'sentence': 'Nice to meet you.',
        'description':
        'Swipe one hand over the other, then bring index fingers together.',
        'image': 'assets/images/nice to meet u1.jpg',
      },
      {
        'sentence': 'Where is the bathroom?',
        'description':
        'Shake the "T" hand shape (thumb between index and middle finger).',
        'image': 'assets/images/where is bathroom.jpg',
      },
      {
        'sentence': 'I love learning sign language.',
        'description':
        'Cross arms over chest for "love" and spell "sign language" in ASL.',
        'image': 'assets/images/i love learning.jpg',
      },

      {
        'sentence': 'Excuse Me',
        'description': 'Hand brushes the other hand lightly.',
        'image': 'assets/images/excuse-me-in-sign-language.jpg',
      },

    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Lesson 4: Common Sentences',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sentences.length,
          itemBuilder: (context, index) {
            final sentence = sentences[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        sentence['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported,
                              size: 80);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sentence['sentence']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            sentence['description']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class Lesson5 extends StatelessWidget {
  const Lesson5({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> numbers = [
      {
        'number': '1',
        'description': 'Hold up your index finger.',
        'image': 'assets/images/number01.jpg',
      },
      {
        'number': '2',
        'description': 'Hold up your index and middle finger.',
        'image': 'assets/images/number02.jpg',
      },
      {
        'number': '3',
        'description': 'Hold up your thumb, index, and middle finger.',
        'image': 'assets/images/number03.jpg',
      },
      {
        'number': '4',
        'description': 'Hold up four fingers, keeping your thumb folded.',
        'image': 'assets/images/number4.jpg',
      },
      {
        'number': '5',
        'description': 'Hold up all five fingers.',
        'image': 'assets/images/number5jpg.jpg',
      },
      {
        'number': '6',
        'description': 'Touch your pinky to your thumb while extending other fingers.',
        'image': 'assets/images/number06.jpg',
      },
      {
        'number': '7',
        'description': 'Touch your ring finger to your thumb while extending other fingers.',
        'image': 'assets/images/number07.jpg',
      },
      {
        'number': '8',
        'description': 'Touch your middle finger to your thumb while extending other fingers.',
        'image': 'assets/images/number08.jpg',
      },
      {
        'number': '9',
        'description': 'Touch your index finger to your thumb while extending other fingers.',
        'image': 'assets/images/number09.jpg',
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Lesson 5: Numbers',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            final number = numbers[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        number['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported, size: 80);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Number ${number['number']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            number['description']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class Lesson6 extends StatelessWidget {
  const Lesson6({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> alphabets = [
      {'letter': 'A', 'description': 'Make a fist with the thumb resting on the side.'},
      {'letter': 'B', 'description': 'Hold your fingers straight up with your thumb across your palm.'},
      {'letter': 'C', 'description': 'Curve your fingers and thumb to form the letter "C".'},
      {'letter': 'D', 'description': 'Make a circle with your index finger and thumb, while the other fingers stay up.'},
      {'letter': 'E', 'description': 'Bend your fingers down with your thumb resting against them.'},
      {'letter': 'F', 'description': 'Touch your thumb and index finger together to form a small circle, keeping other fingers up.'},
      {'letter': 'G', 'description': 'Hold your index finger and thumb parallel while pointing to the side.'},
      {'letter': 'H', 'description': 'Extend your index and middle finger sideways while keeping the others folded.'},
      {'letter': 'I', 'description': 'Hold your pinky finger up while keeping the others curled into a fist.'},
      {'letter': 'J', 'description': 'Make an "I" sign and move it downward in a "J" shape.'},
      {'letter': 'K', 'description': 'Raise your index and middle finger in a "V" shape, with your thumb touching the middle finger.'},
      {'letter': 'L', 'description': 'Extend your thumb and index finger to form an "L" shape.'},
      {'letter': 'M', 'description': 'Tuck your thumb under your first three fingers while keeping the pinky up.'},
      {'letter': 'N', 'description': 'Tuck your thumb under your first two fingers while keeping the last two up.'},
      {'letter': 'O', 'description': 'Curve all fingers to form a circular "O" shape.'},
      {'letter': 'P', 'description': 'Make a "K" shape but tilt your hand downward.'},
      {'letter': 'Q', 'description': 'Make a "G" shape but point your hand downward.'},
      {'letter': 'R', 'description': 'Cross your index and middle finger while keeping the rest curled.'},
      {'letter': 'S', 'description': 'Make a fist with your thumb crossing over the fingers.'},
      {'letter': 'T', 'description': 'Tuck your thumb between your index and middle fingers.'},
      {'letter': 'U', 'description': 'Hold your index and middle fingers together, pointing up.'},
      {'letter': 'V', 'description': 'Extend your index and middle fingers in a "V" shape.'},
      {'letter': 'W', 'description': 'Extend three fingers up to resemble a "W".'},
      {'letter': 'X', 'description': 'Curl your index finger while keeping the rest in a fist.'},
      {'letter': 'Y', 'description': 'Extend your thumb and pinky finger outward while the others stay folded.'},
      {'letter': 'Z', 'description': 'Use your index finger to draw a "Z" shape in the air.'},
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Increased height
        child: AppBar(
          backgroundColor: Colors.purple, // Purple AppBar
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white), // White back icon
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Lesson 6: English Alphabets',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'English Alphabets with Hand Gestures',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.asset('assets/images/ABCjpg.jpg'),
              SizedBox(height: 10),
              ...alphabets.map((alphabet) {
                return buildAlphabetContainer(alphabet['letter']!, alphabet['description']!);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAlphabetContainer(String letter, String description) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Letter: $letter',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
