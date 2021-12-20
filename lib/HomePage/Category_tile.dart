import 'package:flutter/material.dart';

import '../AnimeRaw_links/AnimeRaw_detail_screen.dart';

class CategorieCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;

  CategorieCard(
      {required this.imgPath, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15, top: 35.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Hero(
                  tag: imgPath,
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
        ),
      ),
    );
  }
}
