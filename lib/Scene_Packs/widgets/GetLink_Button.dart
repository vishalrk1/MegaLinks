// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:onikiri_ui/adds/ad_state.dart';
// import 'package:onikiri_ui/helpers/Url_Launcher.dart';
// import 'package:onikiri_ui/models/ScenePack_model.dart';

// import '../scenePack_card.dart';

// class GetLinkButton extends StatefulWidget {
//   const GetLinkButton({
//     Key? key,
//     required this.scenepack,
//   }) : super(key: key);

//   final ScenePackModel scenepack;

//   @override
//   _GetLinkButtonState createState() => _GetLinkButtonState();
// }

// class _GetLinkButtonState extends State<GetLinkButton> {
//   // late InterstitialAd _interstitialAd;
//   // int _numInterstitialLoadAttempts = 0;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _createInterstitialAd();
//   // }

//   // void _createInterstitialAd() {
//   //   InterstitialAd.load(
//   //     adUnitId: InterstitialAd.testAdUnitId,
//   //     request: AdRequest(),
//   //     adLoadCallback: InterstitialAdLoadCallback(
//   //       onAdLoaded: (InterstitialAd ad) {
//   //         print('$ad loaded');
//   //         _interstitialAd = ad;
//   //         _numInterstitialLoadAttempts = 0;
//   //         _interstitialAd.setImmersiveMode(true);
//   //       },
//   //       onAdFailedToLoad: (LoadAdError error) {
//   //         print('InterstitialAd failed to load: $error.');
//   //         _numInterstitialLoadAttempts += 1;
//   //         // _interstitialAd = null;
//   //         if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
//   //           _createInterstitialAd();
//   //         }
//   //       },
//   //     ),
//   //   );
//   // }

//   // void _showInterstitialAd() {
//   //   if (_interstitialAd == null) {
//   //     print('Warning: attempt to show interstitial before loaded.');
//   //     return;
//   //   }
//   //   _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
//   //     onAdShowedFullScreenContent: (InterstitialAd ad) =>
//   //         print('ad onAdShowedFullScreenContent.'),
//   //     onAdDismissedFullScreenContent: (InterstitialAd ad) {
//   //       print('$ad onAdDismissedFullScreenContent.');
//   //       ad.dispose();
//   //       _createInterstitialAd();
//   //     },
//   //     onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//   //       print('$ad onAdFailedToShowFullScreenContent: $error');
//   //       ad.dispose();
//   //       _createInterstitialAd();
//   //     },
//   //   );
//   //   _interstitialAd.show();
//   //   // _interstitialAd = null;
//   // }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   _interstitialAd.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // ignore: deprecated_member_use
//     return RaisedButton(
//       onPressed: () {
//         UrlLauncher().launchInBrowser(widget.scenepack.link);
//         LoadAds().showInterstitialAd();
//       },
//       shape: RoundedRectangleBorder(
//         borderRadius: new BorderRadius.circular(18.0),
//       ),
//       color: Colors.amber[200],
//       child: Text(
//         'Get Link ',
//         style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//       ),
//       padding: EdgeInsets.all(15),
//     );
//   }
// }
