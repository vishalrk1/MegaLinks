import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/Colors.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:onikiri_ui/helpers/Url_Launcher.dart';
import 'package:onikiri_ui/models/ScenePack_model.dart';
import 'package:provider/provider.dart';

class ScenePackCard extends StatefulWidget {
  final ScenePackModel scenePack;
  ScenePackCard({this.scenePack});

  @override
  _ScenePackCardState createState() => _ScenePackCardState();
}

class _ScenePackCardState extends State<ScenePackCard> {
  InterstitialAd _interstitialAd;

// loading ad.....................................................................................
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
    Image img = Image.network(widget.scenePack.image); // widget.imgPath
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 300,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: img != null
                        ? Image.network(
                            widget.scenePack.image,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset('assets/AboutHeader.jpg'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.scenePack.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Credits: ${widget.scenePack.credit}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        UrlLauncher().launchInBrowser(widget.scenePack.link);
                        _interstitialAd.show();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      color: Colors.amber[200],
                      child: Text(
                        'Get Link ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      padding: EdgeInsets.all(15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetLinkButton extends StatelessWidget {
  const GetLinkButton({
    Key key,
    @required this.widget,
    @required InterstitialAd interstitialAd,
  })  : _interstitialAd = interstitialAd,
        super(key: key);

  final ScenePackCard widget;
  final InterstitialAd _interstitialAd;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: () {
        UrlLauncher().launchInBrowser(widget.scenePack.link);
        if (_interstitialAd.show() != null) {
          _interstitialAd.show();
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
      ),
      color: Colors.amber[200],
      child: Text(
        'Get Link ',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      padding: EdgeInsets.all(15),
    );
  }
}
