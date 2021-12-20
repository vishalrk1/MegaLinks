import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:onikiri_ui/DataProvider/FireBase_Constants.dart';
import 'package:provider/provider.dart';

import 'ad_state.dart';

class AdMob with ChangeNotifier {
  String bannerAd = 'ca-app-pub-9593982606370172/4414178452';
  String interstitialAd = 'ca-app-pub-9593982606370172/7586232749';

  // Future<void> getAdId() async {
  //   QuerySnapshot snapShot =
  //       await FirebaseFirestore.instance.collection(ADS).get();
  //   snapShot.docs.forEach((DocumentSnapshot doc) {
  //     if (doc.id == "Banner ad") {
  //       bannerAd = doc.get('Id');
  //     } else {
  //       // interstitialAd = doc.get('Id');
  //     }
  //   });
  //   print("$bannerAd , $interstitialAd");
  // }

  // void initializeAds(BuildContext context) {
  //   final adState = Provider.of<AdState>(context);
  //   adState.initialization;
  // }
}
