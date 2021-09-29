import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/HomePage/AnimatedText/Header_Animated_text.dart';
import 'package:onikiri_ui/Preset%20Packs/Free%20Preset%20Packs/Free_PresetPacks_Screen.dart';
import 'package:onikiri_ui/Preset%20Packs/PresetPacks_Tabs_Screen.dart';
import 'package:onikiri_ui/adds/ad_Id.dart';
import 'package:onikiri_ui/adds/ad_state.dart';
import 'package:onikiri_ui/helpers/Url_Launcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/AppDrawer.dart';
import '../AnimeRaw_links/AnimeRaw_detail_screen.dart';
import 'CategoryTile.dart';
import '../models/Category.dart';
import '../Tutorials/Tutorials_detailScreen.dart';
import '../Scene_Packs/ScenePack_detailScreen.dart';
import '../ProjectFile_Section/FreePf_Screen.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = '/homepage-screen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  BannerAd homePageBanner;
  var _exit = false;

  @override
  void initState() {
    getAdUnits();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        homePageBanner = BannerAd(
          adUnitId: adState.scenePackSubmitionBannerAdUnitId,
          size: AdSize.largeBanner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  Future<void> getScenePackData() async {
    await Provider.of<DataProvider>(context, listen: false).getScenePack();
  }

  Future<void> getTutorialData() async {
    await Provider.of<DataProvider>(context, listen: false).getTutorials();
  }

  Future<void> getAnimeRawData() async {
    await Provider.of<DataProvider>(context, listen: false).getAnimeRawData();
  }

  Future<void> getProjectFileData() async {
    await Provider.of<DataProvider>(context, listen: false).getProjectFileata();
  }

  Future<void> getPresetPacks() async {
    await Provider.of<DataProvider>(context, listen: false)
        .getPresetData(category: "Free");
  }

  Future<void> getAdUnits() async {
    await Provider.of<AdMob>(context, listen: false).getAdId();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text(
                    """MEGA LINKS""",
                  ),
                  content: Text(
                      """we're working too much to provide you all free resources


Please give us 5 stars to support our work """),
                  actions: [
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          _exit = true;
                        });
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else {
                          exit(0);
                        }
                      },
                      child: Text(
                        "NO THANKS :(",
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.w400),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      onPressed: () {
                        UrlLauncher().launchInBrowser(
                            "https://play.google.com/store/apps/details?id=com.vk.MegaLinks");
                      },
                      child: Text(
                        "OF COURSE",
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ));
        if (_exit) {
          return true;
        } else {
          return false;
        }
      },
      child: Scaffold(
        backgroundColor:
            Colors.purpleAccent[100], //8F48AE  0xFF21BFBD  Color(0xFF21BFBD)
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent[100],
          elevation: 0,
          toolbarHeight: 60,
        ),
        drawer: AppDrawer(),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'MEGA LINKS',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 5),
              child: HomeAnimatedText(),
            ),
            SizedBox(height: 40.0),
            Container(
              height: MediaQuery.of(context).size.height - 90.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.0),
                    topRight: Radius.circular(55.0)),
              ),
              child: Column(
                // primary: false,
                // padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 200.0,
                      child: ListView(
                        children: [
                          // Anime Raw category Card......................................................................................................................
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15, top: 40.0),
                            child: InkWell(
                                onTap: () {
                                  getAnimeRawData();
                                  Navigator.of(context).pushNamed(
                                    AnimeRawDetailsPage.routeName,
                                    arguments: Category(
                                      image: 'assets/plate8.jpg',
                                      title: 'Anime Raws',
                                      info: 'Get high quality anime',
                                    ),
                                  );
                                },
                                child: CardInfo(
                                    imgPath: 'assets/plate8.jpg',
                                    title: 'Anime Raws',
                                    description: 'Get high quality anime')),
                          ),
                          // Scene pack Category Card .................................................................................................................................................
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15, top: 25.0),
                            child: InkWell(
                                onTap: () {
                                  getScenePackData();
                                  Navigator.of(context).pushNamed(
                                    ScenePackScren.routeName,
                                    arguments: Category(
                                      image: 'assets/pfp8.jpg',
                                      title: 'Scene Packs',
                                      info: 'movies and web series characters ',
                                    ),
                                  );
                                },
                                child: CardInfo(
                                    imgPath: 'assets/pfp8.jpg',
                                    title: 'Scene Packs',
                                    description:
                                        "movies and web series characters ")),
                          ),
// tutorial card............................................................................
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15, top: 25.0),
                            child: InkWell(
                              onTap: () {
                                getTutorialData();
                                Navigator.of(context).pushNamed(
                                  TutorialsScren.routeName,
                                  arguments: Category(
                                    image: 'assets/pfp4.jpg',
                                    title: 'Editing Tutorial',
                                    info: 'Editing tutorials for Beginners',
                                  ),
                                );
                              },
                              child: CardInfo(
                                imgPath: 'assets/pfp4.jpg',
                                title: 'Editing Tutorial',
                                description: 'Editing tutorials for Beginners',
                              ),
                            ),
                          ),
// Free Project file Screen ........................................................................................................................................................
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15, top: 25.0),
                            child: InkWell(
                              onTap: () {
                                getProjectFileData();
                                Navigator.of(context).pushNamed(
                                  FreePfScreen.routeName,
                                  arguments: Category(
                                    image: 'assets/pfp7.jpg',
                                    title: 'ProjectFiles',
                                    info: 'Editing tutorials for Beginners',
                                  ),
                                );
                              },
                              child: CardInfo(
                                imgPath: 'assets/pfp7.jpg',
                                title: 'ProjectFiles',
                                description:
                                    'Free Project Files of Ae,SVP or Am',
                              ),
                            ),
                          ),
                          //Preset Pack Section.......................................................................................
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15, top: 25.0),
                            child: InkWell(
                              onTap: () {
                                getPresetPacks();
                                Navigator.of(context).pushNamed(
                                  PresetPackTabScreen.routName,
                                  arguments: Category(
                                    image: 'assets/pfp3.jpg',
                                    title: 'Preset Packs',
                                    info: 'Editing tutorials for Beginners',
                                  ),
                                );
                              },
                              child: CardInfo(
                                imgPath: 'assets/pfp3.jpg',
                                title: 'Preset Packs',
                                description: 'Free & Paid Preset Packs',
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
