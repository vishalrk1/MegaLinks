import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/HomePage/homePage_screen.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';

import '../main.dart';

class SubmitedAlertDialog extends StatefulWidget {
  const SubmitedAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  _SubmitedAlertDialogState createState() => _SubmitedAlertDialogState();
}

class _SubmitedAlertDialogState extends State<SubmitedAlertDialog> {
// loading ads .......................................................................

  InterstitialAd? _interstitialAd;
  bool _isInterstitialAdReady = false;
  int _numInterstitialLoadAttempts = 1;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdMob().interstitialAd,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
            _isInterstitialAdReady = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            _isInterstitialAdReady = false;
            if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Submited successfully'),
      content: Text(
          """Thank you for helping us and sharing your work with everyone"""),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
            onPressed: () {
              if (_isInterstitialAdReady == true) {
                _showInterstitialAd();
              }
              Navigator.of(context)
                  .pushReplacementNamed(HomePageScreen.routeName);
            },
            child: Text('Okay'))
      ],
    );
  }
}
