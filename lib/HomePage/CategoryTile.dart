import 'package:flutter/material.dart';

import '../AnimeRaw_links/AnimeRaw_detail_screen.dart';

class CardInfo extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;

  CardInfo({this.imgPath, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Hero(
              tag: title,
              child: ClipOval(
                child: Image(
                  image: AssetImage(imgPath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          title: Text(title,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold)),
          subtitle: Text(description,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                  color: Colors.grey)),
        ),
      ),
    );
  }
}
