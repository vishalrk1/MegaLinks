import 'package:flutter/material.dart';

class AnimeModel {
  final String tital;
  final String description;
  final String link;

  const AnimeModel({
    this.tital,
    this.description,
    this.link,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      tital: json['title'],
      link: json['link'],
      description: json['description'],
    );
  }
}
