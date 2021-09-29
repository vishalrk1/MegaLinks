import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/Colors.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:onikiri_ui/helpers/Url_Launcher.dart';
import 'package:onikiri_ui/models/AnimeModel.dart';
import 'package:provider/provider.dart';

class AnimeRawInfoCard extends StatefulWidget {
  final AnimeModel animeRaw;

  AnimeRawInfoCard({this.animeRaw});

  @override
  _AnimeRawInfoCardState createState() => _AnimeRawInfoCardState();
}

class _AnimeRawInfoCardState extends State<AnimeRawInfoCard> {
  InterstitialAd _interstitialAd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    final adProvider = Provider.of<AdMob>(context);
    adState.initialization.then(
      (value) {
        InterstitialAd.load(
          adUnitId: adProvider.interstitialAd,
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              // Keep a reference to the ad so you can show it later.
              this._interstitialAd = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error');
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white,
      ),
      height: 110,
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Text(
                    widget.animeRaw.tital,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                )),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, bottom: 5),
                      child: Text(
                        widget.animeRaw.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: IconButton(
                onPressed: () {
                  UrlLauncher().launchInBrowser(widget.animeRaw.link);
                  if (_interstitialAd.show() != null) {
                    _interstitialAd.show();
                  }
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
