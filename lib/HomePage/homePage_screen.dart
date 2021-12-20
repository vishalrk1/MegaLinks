import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:onikiri_ui/DataProvider/DataProvider.dart';
import 'package:onikiri_ui/HomePage/AnimatedText/Header_Animated_text.dart';
import 'package:onikiri_ui/Preset%20Packs/PresetPacks_Tabs_Screen.dart';
import 'package:provider/provider.dart';

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
  late BannerAd homePageBanner;
  var _exit = false;

  @override
  void initState() {
    // getAdUnits();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          padding:
                              EdgeInsets.only(left: 15.0, right: 15, top: 40.0),
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
                          padding:
                              EdgeInsets.only(left: 15.0, right: 15, top: 25.0),
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
                          padding:
                              EdgeInsets.only(left: 15.0, right: 15, top: 25.0),
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
                          padding:
                              EdgeInsets.only(left: 15.0, right: 15, top: 25.0),
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
                              description: 'Free Project Files of Ae,SVP or Am',
                            ),
                          ),
                        ),
                        //Preset Pack Section.......................................................................................
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15.0, right: 15, top: 25.0),
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
    );
  }
}
