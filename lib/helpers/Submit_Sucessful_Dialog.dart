import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/HomePage/homePage_screen.dart';

class SubmitedAlertDialog extends StatelessWidget {
  final InterstitialAd showAd;
  const SubmitedAlertDialog({Key key, this.showAd}) : super(key: key);

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
              if (showAd.show() != null) {
                showAd.show();
              }
              Navigator.of(context)
                  .pushReplacementNamed(HomePageScreen.routeName);
            },
            child: Text('Okay'))
      ],
    );
  }
}
