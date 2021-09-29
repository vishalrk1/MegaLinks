import 'package:flutter/material.dart';

import '../../Colors.dart';

class BlueGredientButtom extends StatelessWidget {
  final String text;
  final Function() onPressed;

  BlueGredientButtom({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorAccent,
                ColorPrimaryDark,
              ]),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: white,
          ),
        ),
      ),
    );
  }
}
