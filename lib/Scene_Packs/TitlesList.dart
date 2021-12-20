import 'package:flutter/material.dart';

class SearchOptions {
  final String title;
  SearchOptions({required this.title});
}

class TitlesList with ChangeNotifier {
  List<String> titleData = [];
}

class ImageLinks with ChangeNotifier {
  List<String> imageList = [];
}

class LinksList with ChangeNotifier {
  List<String> linkList = [];
}

class CreditsList with ChangeNotifier {
  List<String> CreditList = [];
}
