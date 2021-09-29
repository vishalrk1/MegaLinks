import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/Colors.dart';

class HomeAnimatedText extends StatelessWidget {
  const HomeAnimatedText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black45,
          fontFamily: "Montserrat"),
      child: Row(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'Anime Raws',
                speed: Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                'Editing Tutorials',
                speed: Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                'Free Project Files',
                speed: Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                'Free Preset Packs',
                speed: Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                'Scene Packs',
                speed: Duration(milliseconds: 60),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
