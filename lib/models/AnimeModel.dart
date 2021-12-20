import 'package:flutter/material.dart';

class AnimeModel {
  final String tital;
  final String description;
  final String link;

  const AnimeModel({
    required this.tital,
    required this.description,
    required this.link,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      tital: json['title'],
      link: json['link'],
      description: json['description'],
    );
  }
}
