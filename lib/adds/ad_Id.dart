import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:onikiri_ui/DataProvider/FireBase_Constants.dart';

class AdMob with ChangeNotifier {
  String bannerAd;
  String interstitialAd;

  Future<void> getAdId() async {
    QuerySnapshot snapShot =
        await FirebaseFirestore.instance.collection(ADS).get();
    snapShot.docs.forEach((DocumentSnapshot doc) {
      if (doc.id == "Banner ad") {
        bannerAd = doc.get('Id');
      } else {
        interstitialAd = doc.get('Id');
      }
    });
    print("$bannerAd , $interstitialAd");
  }
}
