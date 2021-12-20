import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/DataProvider/DataUploader.dart';
import 'package:onikiri_ui/Input%20Screens/SubmitData_Screen.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:onikiri_ui/helpers/Submit_Sucessful_Dialog.dart';
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
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  var _isLoading = false;

  Map<String, dynamic> data = {
    'title': '',
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
    _bannerAd.dispose();
    super.dispose();
  }

// saving form.............................
  void _saveForm(BuildContext context) {
    final dataUploader =
        Provider.of<DataUploadProvider>(context, listen: false);

    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    dataUploader.uploadTutorial(data).then(
          (value) => showDialog(
            context: context,
            builder: (ctx) => SubmitedAlertDialog(),
            barrierDismissible: false,
          ),
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
                decoration: InputDecoration(labelText: 'Tutorial Title'),
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
                  if (value!.isEmpty) {
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
                    data['category'] = _typeSelected;
                    _saveForm(context);
                  },
                ),
              ),
              _isBannerAdReady == false
                  ? SizedBox(
                      height: 250,
                      child: Center(child: CircularProgressIndicator()),
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
