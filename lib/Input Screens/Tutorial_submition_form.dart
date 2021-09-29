import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/HomePage/homePage_screen.dart';
import 'package:onikiri_ui/Input%20Screens/SubmitData_Screen.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:provider/provider.dart';

class TutorialSubmitionScreen extends StatefulWidget {
  static const routName = '/tutorial-form';
  @override
  _TutorialSubmitionScreenState createState() =>
      _TutorialSubmitionScreenState();
}

class _TutorialSubmitionScreenState extends State<TutorialSubmitionScreen> {
  final _titleFocusNode = FocusNode();
  final _linkFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  String _typeSelected = '';
  BannerAd tutBanner;
  InterstitialAd _interstitialAd;

  var _isLoading = false;

  Map<String, dynamic> data = {
    'channel name': '',
    'link': '',
    'category': '',
  };

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: _typeSelected == title ? Colors.green : Colors.purple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _linkFocusNode.dispose();
    super.dispose();
  }

  CollectionReference _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseFirestore.instance.collection('SubmitedData');
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    _ref.add(data).then(
      (value) {
        // Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Submited successfully'),
            content: Text(
                """Thank you for helping us and sharing your tutorials with everyone. our mods will add your pack shortly"""),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    if (_interstitialAd.show() != null) {
                      _interstitialAd.show();
                    }
                    Navigator.of(context)
                        .pushReplacementNamed(HomePageScreen.routeName);
                  },
                  child: Text('Okay'))
            ],
          ),
        );
      },
    );
    setState(() {
      _isLoading = false;
    });
  }

// field for ad.....................................................................................
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    final adProvider = Provider.of<AdMob>(context);
    adState.initialization.then((status) {
      setState(() {
        tutBanner = BannerAd(
          adUnitId: adProvider.bannerAd,
          size: AdSize.largeBanner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });

    final adState2 = Provider.of<AdState>(context);
    adState2.initialization.then(
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed(DataSubmitScreen.routName);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF7A9BEE),
        elevation: 0.0,
        title: Text('Tutorials',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: new Icon(Icons.more_horiz),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Submit Tutorial Links',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
// first text field.......................................................................................................
              TextFormField(
                decoration: InputDecoration(labelText: 'Channel Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_titleFocusNode);
                },
                onSaved: (value) {
                  data['channel name'] = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Entre Something';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
// Second text field.......................................................................................................
              TextFormField(
                decoration: InputDecoration(labelText: 'Youtube Link'),
                textInputAction: TextInputAction.next,
                focusNode: _titleFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_linkFocusNode);
                },
                onSaved: (value) {
                  data['link'] = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Invalid Link';
                  }
                  if (!value.startsWith('http') &&
                      !value.startsWith('https') &&
                      !value.startsWith('youtube')) {
                    return 'Please enter a valid URL.';
                  }
                  if (!value.contains('youtube.com') &&
                      !value.contains('youtu.be')) {
                    return 'Please enter a valid URL.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildContactType('After Effects'),
                    SizedBox(width: 10),
                    _buildContactType('Sony Vegas Pro'),
                    SizedBox(width: 10),
                    _buildContactType('Alight Motion'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
// Button......................................................................................
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  color: Colors.amber[200],
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    data['category'] = _typeSelected;
                    _saveForm();
                  },
                ),
              ),
              tutBanner == null
                  ? SizedBox(
                      height: 250,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: 250,
                      child: AdWidget(
                        ad: tutBanner,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
