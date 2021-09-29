import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onikiri_ui/DataProvider/FireBase_Constants.dart';
import 'package:onikiri_ui/models/AnimeModel.dart';
import 'package:onikiri_ui/models/FeedBack_Model.dart';
import 'package:onikiri_ui/models/PfModel.dart';
import 'package:onikiri_ui/models/PresetPack_Model.dart';
import 'package:onikiri_ui/models/ScenePack_model.dart';
import 'package:onikiri_ui/models/TutorialModel.dart';

class DataProvider with ChangeNotifier {
  bool isLoding = true;
  bool isError = false;
  String errorMessage;
  List<ScenePackModel> scenePackList = [];
  List<TutorialModel> tutorialsList = [];
  List<AnimeModel> animeRawList = [];
  List<PfModel> projectFileList = [];
  List<FeedBackModel> feedBacksList = [];
  List<PresetPackModel> presetList = [];

  List<String> titleList = [];

  Future<void> getScenePack() async {
    try {
      isLoding = true;
      isError = false;
      QuerySnapshot ref =
          await FirebaseFirestore.instance.collection(SCENE_PACKS).get();
      List<ScenePackModel> items = [];
      ref.docs.forEach((DocumentSnapshot doc) {
        ScenePackModel scenePack = ScenePackModel.fromJson(doc.data());
        items.add(scenePack);
      });
      scenePackList = items;
      isLoding = false;
      print("total Packs :- ${scenePackList.length}");
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  Future<void> getTutorials({String software = "After Effects"}) async {
    try {
      isLoding = true;
      isError = false;
      QuerySnapshot ref = await FirebaseFirestore.instance
          .collection(TUTORIAL)
          .where('category', isEqualTo: software)
          .get();
      List<TutorialModel> items = [];
      ref.docs.forEach((DocumentSnapshot doc) {
        TutorialModel tut = TutorialModel.fromJson(doc.data());
        items.add(tut);
      });
      tutorialsList = items;
      isLoding = false;
      print("Tutorials :- ${tutorialsList.length}");
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  Future<void> getAnimeRawData() async {
    try {
      isLoding = true;
      isError = false;
      QuerySnapshot ref =
          await FirebaseFirestore.instance.collection(ANIME_RAWS).get();
      List<AnimeModel> items = [];
      ref.docs.forEach((DocumentSnapshot doc) {
        AnimeModel raw = AnimeModel.fromJson(doc.data());
        items.add(raw);
      });
      animeRawList = items;
      isLoding = false;
      print("Anime Raws :- ${animeRawList.length}");
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  Future<void> getProjectFileata({String software = "After Effects"}) async {
    try {
      isLoding = true;
      isError = false;
      QuerySnapshot ref = await FirebaseFirestore.instance
          .collection(PROJECT_FILE)
          .where('category', isEqualTo: software)
          .get();
      List<PfModel> items = [];
      ref.docs.forEach((DocumentSnapshot doc) {
        PfModel file = PfModel.fromJson(doc.data());
        items.add(file);
      });
      projectFileList = items;
      isLoding = false;
      print("Project Files :- ${projectFileList.length}");
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  Future<void> getFeedbacks() async {
    try {
      isLoding = true;
      isError = false;
      QuerySnapshot ref =
          await FirebaseFirestore.instance.collection(FEEDBACK).get();
      List<FeedBackModel> items = [];
      ref.docs.forEach((DocumentSnapshot doc) {
        FeedBackModel feedBack = FeedBackModel.fromJson(doc.data());
        items.add(feedBack);
      });
      feedBacksList = items;
      isLoding = false;
      print("FeedBacks :- ${feedBacksList.length}");
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  Future<void> getPresetData({String category = "Free"}) async {
    try {
      isLoding = true;
      isError = false;
      QuerySnapshot ref = await FirebaseFirestore.instance
          .collection(PRESET_PACKS)
          .where("category", isEqualTo: category)
          .get();
      List<PresetPackModel> items = [];
      ref.docs.forEach((DocumentSnapshot doc) {
        PresetPackModel pack = PresetPackModel.fromJson(doc.data());
        items.add(pack);
      });
      presetList = items;
      isLoding = false;
      print("Preset Packs :- ${presetList.length}");
      print(isLoding);
      notifyListeners();
    } catch (e) {
      isError = true;
      notifyListeners();
      errorMessage = "Something Went Wrong Please try again later";
      print(e);
    }
  }

  void getTitleList(List<ScenePackModel> splist) {
    splist.forEach((sp) {
      titleList.add(sp.title.toString());
    });
  }
}
