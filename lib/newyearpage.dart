import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class NewYearPage extends StatelessWidget {
  const NewYearPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(pause: Duration(seconds: 0), animatedTexts: [
          ColorizeAnimatedText(
            "HAPPY NEW YEAR 2022",
            speed: Duration(milliseconds: 500),
            colors: [
              Colors.pink,
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.pink,
              Colors.amber,
              Colors.pink,
            ],
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontFamily: "Disco",
              fontSize: 80,
            ),
          ),
          ColorizeAnimatedText(
            "HAPPY NEW YEAR 2022",
            speed: Duration(milliseconds: 500),
            colors: [
              Colors.yellow,
              Colors.pink,
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.pink,
              Colors.amber,
              Colors.yellow,
            ],
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontFamily: "Disco",
              fontSize: 80,
            ),
          ),
          ColorizeAnimatedText(
            "HAPPY NEW YEAR 2022",
            speed: Duration(seconds: 1),
            colors: [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.pink,
              Colors.pink,
              Colors.amber,
            ],
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontFamily: "Disco",
              fontSize: 80,
            ),
          ),
        ]),
      ),
    );
  }
}
