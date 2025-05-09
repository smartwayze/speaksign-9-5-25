import 'dart:async';
import 'package:flutter/material.dart';
import 'package:speaksigns/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late int _currentLetterIndex;
  late List<String> _textList;

  @override
  void initState() {
    super.initState();

    _textList = "SpeakSigns".split('');
    _currentLetterIndex = 0;

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (_currentLetterIndex < _textList.length) {
        setState(() {
          _currentLetterIndex++;
        });
      } else {
        timer.cancel();
      }
    });

    Timer(Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) =>
                WelcomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0.0, 1.0), // Start from bottom
                  end: Offset.zero, // Move to normal position
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                )),
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure no extra space
          children: [
            Column(
              mainAxisSize: MainAxisSize.min, // Removes extra space
              children: [
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    'assets/images/logopicture splashscreen.png',
                    width: 200,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                // Directly attach text without extra spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _currentLetterIndex,
                        (index) => Text(
                      _textList[index],
                      style: TextStyle(
                        fontSize: 38,
                        fontFamily: 'RoundWellExtraBold',
                        fontWeight: FontWeight.w900,
                        color: Colors.purple,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
