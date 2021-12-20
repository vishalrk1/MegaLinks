import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/DataProvider/DataUploader.dart';
import 'package:onikiri_ui/Input%20Screens/SubmitData_Screen.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:onikiri_ui/helpers/Submit_Sucessful_Dialog.dart';
import 'package:provider/provider.dart';

class ScenePackSubmitionScreen extends StatefulWidget {
  static const routName = '/submition-form';
  @override
  _ScenePackSubmitionScreenState createState() =>
      _ScenePackSubmitionScreenState();
}

class _ScenePackSubmitionScreenState extends State<ScenePackSubmitionScreen> {
  final _titleFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _linkFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  var _isLoading = false;

  Map<String, dynamic> data = {
    'title': '',
    'link': '',
    'image': '',
    'credit': '',
  };

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _linkFocusNode.dispose();
    _bannerAd.dispose();
    super.dispose();
  }

  void _saveForm(BuildContext context) {
    final uploadProvider =
        Provider.of<DataUploadProvider>(context, listen: false);
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    uploadProvider.uploadScenePack(data)
      ..then(
        (value) {
          showDialog(
            context: context,
            builder: (ctx) => SubmitedAlertDialog(),
            barrierDismissible: false,
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
    final adProvider = Provider.of<AdMob>(context);
    _bannerAd = BannerAd(
      adUnitId: adProvider.bannerAd,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
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
        title: Text('Scene Packs',
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
                  'Submit Scene Pack',
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
                decoration: InputDecoration(labelText: 'Character Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_titleFocusNode);
                },
                onSaved: (value) {
                  data['title'] = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
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
                decoration: InputDecoration(labelText: 'Scene Pack Link'),
                textInputAction: TextInputAction.next,
                focusNode: _titleFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_imageFocusNode);
                },
                onSaved: (value) {
                  data['link'] = value;
                  // newModel.link = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Invalid Link';
                  }
                  if (!value.startsWith('http') && !value.startsWith('https')) {
                    return 'Please enter a valid URL.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
// third text field.......................................................................................................
              TextFormField(
                decoration: InputDecoration(labelText: 'Character Image Link'),
                textInputAction: TextInputAction.next,
                focusNode: _imageFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_linkFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Invalid Link';
                  }
                  if (!value.startsWith('http') && !value.startsWith('https')) {
                    return 'Please enter a valid URL.';
                  }
                  if (!value.endsWith('png') && !value.endsWith('jpg')) {
                    return 'Please enter a valid URL.';
                  }
                  return null;
                },
                onSaved: (value) {
                  data['image'] = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
// fourth text field.......................................................................................................
              TextFormField(
                decoration: InputDecoration(labelText: 'Credits'),
                textInputAction: TextInputAction.next,
                focusNode: _linkFocusNode,
                onSaved: (value) {
                  data['credit'] = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Entre Credits for this Pack';
                  }
                  return null;
                },
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 50,
                ),
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
                    _saveForm(context);
                  },
                ),
              ),
              _isBannerAdReady == false
                  ? SizedBox(
                      height: 250,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: 250,
                      child: AdWidget(
                        ad: _bannerAd,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
