import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:speaksigns/activitypage.dart';
import 'package:speaksigns/sign%20to%20text%20page.dart';
import 'package:speaksigns/splash%20screen.dart';
import 'homepage.dart';
import 'profilescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD0MPQ8vftvKrsZ0QuRPOwBFrWINN7-buU",
      appId: "1:83979387987:android:90b56f667d5ee57b3332a6",
      messagingSenderId: "83979387987",
      projectId: "speaksigns-7b4f3",
    ),
  );
  runApp(SpeakSignsApp());
}

class SpeakSignsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpeakSigns',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    homescreen(),
    activityscreen(),
    Profilescreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.purple,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
