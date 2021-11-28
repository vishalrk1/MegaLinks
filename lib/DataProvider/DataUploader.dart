import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/models/ScenePack_model.dart';

import 'FireBase_Constants.dart';

class DataUploadProvider with ChangeNotifier {
  bool isLoding = true;
  bool isError = false;
  String errorMessage;

  Future<void> uploadScenePack(Map<String, dynamic> inputData) async {
    try {
      isLoding = true;
      isError = false;
      CollectionReference ref =
          FirebaseFirestore.instance.collection(SCENE_PACKS);
      ref.add({
        'title': inputData['title'],
        'link': inputData['link'],
        'image': inputData['image'],
        'credit': inputData['credit'],
      });
      isLoding = false;
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  Future<void> uploadTutorial(Map<String, dynamic> inputData) async {
    try {
      isLoding = true;
      isError = false;
      CollectionReference ref = FirebaseFirestore.instance.collection(TUTORIAL);
      ref.add({
        'title': inputData['title'],
        'link': inputData['link'],
        'category': inputData['category'],
      });
      isLoding = false;
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  Future<void> uploadProjectFile(Map<String, dynamic> inputData) async {
    try {
      isLoding = true;
      isError = false;
      CollectionReference ref =
          FirebaseFirestore.instance.collection(PROJECT_FILE);
      ref.add({
        'title': inputData['title'],
        'pflink': inputData['pflink'],
        'editlink': inputData['editlink'],
        'category': inputData['category'],
        'credit': inputData['credit'],
      });
      isLoding = false;
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }
}
